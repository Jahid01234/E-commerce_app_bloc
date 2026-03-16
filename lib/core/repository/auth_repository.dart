import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:bloc_ecommerce_app/core/utils/images_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}