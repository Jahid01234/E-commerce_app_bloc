import 'package:bloc_ecommerce_app/core/data/models/brand_model.dart';
import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // brand fetch...........
  Future<List<BrandModel>> fetchBrands() async {
    final List<BrandModel> brandList = [];
    final brandsSnapshot = await _firestore.collection("brands").get();

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
    final brandsSnapshot = await _firestore.collection("products").get();

    try {
      for (var product in brandsSnapshot.docs) {
        productList.add(ProductModel.fromJson(product.data()));
      }
    } catch (e) {
      throw Exception(e);
    }

    return productList;
  }


  // single product fetch...........
  Future<ProductModel?> fetchSingleProduct(String productId)async{
    try {
      final data = await _firestore.collection("products").doc(productId).get();
      if(data.data() != null){
        final product = ProductModel.fromJson(data.data()!);
        return product;
      }
      else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }


}