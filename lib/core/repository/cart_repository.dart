import 'package:bloc_ecommerce_app/core/data/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add product to cart...................
  Future<CartModel?> addProductToCart(CartModel item) async {
    try {
      final ref = await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("cart")
          .add(item.toJson());
      final result = await ref.get();
      if (result.data() != null) {
        return CartModel.fromJson(result.data()!);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fetch product from cart...................
  Future<List<CartModel>> fetchProductsFromCart() async {
    List<CartModel> cartItems = [];
    try {
      final ref = await _fireStore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("cart")
          .get();
      final result = ref.docs;
      for( var doc in result){
        cartItems.add(CartModel.fromJson(doc.data()));
      }
      return cartItems;
    } catch (e) {
      throw Exception(e);
    }
  }
}
