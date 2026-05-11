import 'package:bloc_ecommerce_app/core/data/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CartRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add product to cart...................
  Future<void> addProductToCart(CartModel item) async {
    try {
      await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("cart")
          .doc(item.product.productId)
          .set(item.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fetch products from cart................
  Future<List<CartModel>> fetchProductsFromCart() async {
    try {
      final ref = await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("cart")
          .get();

      return ref.docs
          .map((doc) => CartModel.fromJson(doc.data()))
          .toList();

    } catch (e) {
      throw Exception(e);
    }
  }

  //  Remove product from cart.............
  Future<void> removeProductFromCart(String productId) async {
    try {
      await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("cart")
          .doc(productId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}