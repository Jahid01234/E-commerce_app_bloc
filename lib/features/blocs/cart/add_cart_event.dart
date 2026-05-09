import 'package:bloc_ecommerce_app/core/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddCartEvent extends Equatable{
  const AddCartEvent();

  @override
  List<Object?> get props => [];
}

class AddProductCartButton extends AddCartEvent{
  final CartModel cartProduct;

  const AddProductCartButton({
    required this.cartProduct,
  });

  @override
  List<Object?> get props => [cartProduct];
}
