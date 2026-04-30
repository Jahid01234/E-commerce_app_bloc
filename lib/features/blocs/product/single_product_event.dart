import 'package:equatable/equatable.dart';

class SingleProductEvent extends Equatable {
  const SingleProductEvent();

  @override
  List<Object> get props => [];
}


class FetchSingleProduct extends SingleProductEvent{
  final String productId;
  const FetchSingleProduct({required this.productId});

  @override
  List<Object> get props => [productId];
}

class ChangeProductImage extends SingleProductEvent {
  final int index;

  const ChangeProductImage(this.index);

  @override
  List<Object> get props => [index];
}