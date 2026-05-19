import 'package:bloc_ecommerce_app/core/data/models/favourite_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add product to favourites...................
  Future<void> addProductToFavourite(FavouriteModel item) async {
    try {
      await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("favourites")
          .doc(item.product.productId)
          .set(item.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fetch favourite products...................
  Future<List<FavouriteModel>> fetchFavouriteProducts() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception("User not logged in");
      }

      final ref = await _fireStore
          .collection("users")
          .doc(user.uid)
          .collection("favourites")
          .get();

      return ref.docs
          .map((doc) => FavouriteModel.fromJson(doc.data()))
          .toList();

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Remove product from favourites.............
  Future<void> removeProductFromFavourite(String productId) async {
    try {
      await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("favourites")
          .doc(productId)
          .delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> isFavourite(String productId) async {
    final doc = await _fireStore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("favourites")
        .doc(productId)
        .get();

    return doc.exists;
  }

  Future<void> toggleFavourite(FavouriteModel item) async {
    final isFav = await isFavourite(item.product.productId);

    if (isFav) {
      await removeProductFromFavourite(item.product.productId);
    } else {
      await addProductToFavourite(item);
    }
  }

}