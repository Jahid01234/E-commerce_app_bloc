import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable{
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class FetchCartProduct extends CartEvent{}

class RemoveCartProduct extends CartEvent {
  final String productId;

  const RemoveCartProduct(this.productId);
  @override
  List<Object?> get props => [productId];
}