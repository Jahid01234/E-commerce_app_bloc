import 'package:bloc_ecommerce_app/core/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable{
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState{}

class CartLoading extends CartState{}

class CartProductSuccess extends CartState{
  final List<CartModel> cartProduct;
  const CartProductSuccess(this.cartProduct);

  @override
  List<Object?> get props => [cartProduct];
}



class CartProductFailed extends CartState{
  final String message;
  const CartProductFailed(this.message);

  @override
  List<Object?> get props => [message];
}
