import 'package:bloc_ecommerce_app/core/data/models/user_model.dart';
import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // sign up ..............
  Future<User?> signUpWithEmail(
  String username, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      if (user != null) {
         await createUserInDatabase(user, username);
      }
      return user;
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception(e);
    }
  }

  // sign in ..............
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
        password: password,
      );

      final user = userCredential.user;
      LocalPreferences.setString('username', user?.displayName ?? 'Unknown');
      LocalPreferences.setString('email', user?.email ?? '');
      LocalPreferences.setString('photoUrl', user?.photoURL ?? ImagesPath.thumbnailImg);
      LocalPreferences.setString('phoneNumber', user?.phoneNumber ?? '');

      return user;
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception(e);
    }
  }

  // store user data in FireStore.....
  Future<void> createUserInDatabase(User user, String? username) async {
    final data = UserModel(
        userName: user.displayName ?? username,
        email: user.email,
        photoUrl: user.photoURL,
        phoneNumber: user.phoneNumber);
    await _fireStore
        .collection('users')
        .doc(user.uid)
        .set(data.toJson())
        .then((value) {
      debugPrint('User Inserted, document ${user.uid}');
    });

    LocalPreferences.setString(
        'username', user.displayName ?? username ?? 'Unknown');
    LocalPreferences.setString('email', user.email ?? '');
    LocalPreferences.setString(
        'photoUrl', user.photoURL ?? ImagesPath.thumbnailImg);
    LocalPreferences.setString('phoneNumber', user.phoneNumber ?? '');
  }


}