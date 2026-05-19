import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';

class FavouriteModel {
  final ProductModel product;
  final DateTime addedAt;

  FavouriteModel({
    required this.product,
    required this.addedAt,
  });


  Map<String, dynamic> toJson() {
    return {
      "product": product.toJson(),
      "addedAt": addedAt.toIso8601String(),
    };
  }


  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      product: ProductModel.fromJson(json["product"]),
      addedAt: DateTime.parse(json["addedAt"]),
    );
  }
}