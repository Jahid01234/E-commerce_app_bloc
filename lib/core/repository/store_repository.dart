import 'package:bloc_ecommerce_app/core/data/models/brand_model.dart';
import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:bloc_ecommerce_app/core/data/models/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StoreRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // brand fetch...........
  Future<List<BrandModel>> fetchBrands() async {
    final List<BrandModel> brandList = [];
    final brandsSnapshot = await _fireStore.collection("brands").get();

    try {
      for (var brand in brandsSnapshot.docs) {
        brandList.add(BrandModel.fromJson(brand.data()));
      }
    } catch (e) {
      throw Exception(e);
    }
    return brandList;
  }

  // all product fetch...........
  Future<List<ProductModel>> fetchProducts() async {
    final List<ProductModel> productList = [];

    try {
      final data = await _fireStore.collection('products').get();
      for (var product in data.docs) {
        final singleProduct = ProductModel.fromJson(product.data());
        singleProduct.productId = product.id;
        productList.add(singleProduct);
      }
      return productList;
    } catch (e) {
      throw Exception(e);
    }
  }


  // single product fetch...........
  Future<ProductModel?> fetchSingleProduct(String productId)async{
    try {
      final data = await _fireStore.collection("products").doc(productId).get();
      if(data.data() != null){
        final product = ProductModel.fromJson(data.data()!);
        product.productId = data.id;
        return product;
      }
      else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // submit product review...........
  Future<ReviewModel?> submitProductReview(ReviewModel review)async{
    try {
      final data = await _fireStore.collection("products").doc(review.productId)
          .collection("reviews").add(review.toJson());
      final document = await data.get();

      if(document.data() != null){
        final review = ReviewModel.fromJson(document.data()!);
        return review;
      }
      else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // all product reviews fetch...........
  Future<List<ReviewModel>> fetchProductReviews(String productId) async {
    final List<ReviewModel> reviewList = [];

    try {
      final data = await _fireStore.collection("products").doc(productId)
          .collection("reviews").get();

      if(data.docs.isNotEmpty){
        for(var review in data.docs){
          reviewList.add(ReviewModel.fromJson(review.data()));
        }
      }
      return reviewList;
    } catch (e) {
      throw Exception(e);
    }
  }




}