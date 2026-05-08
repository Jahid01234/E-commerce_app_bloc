import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';

class CartModel {
  final int quantity;
  final VariantItem variant;
  final ProductModel product;


  CartModel({
    required this.quantity,
    required this.variant,
    required this.product,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      quantity: json['quantity'] ?? 1,
      variant: VariantItem.fromJson(json['variant']),
      product: ProductModel.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'variant': variant.toJson(),
      'product': product.toJson(),
    };
  }
}