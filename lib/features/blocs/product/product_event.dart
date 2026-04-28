import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent{}

class FetchSingleProducts extends ProductEvent{
  final String productId;

  const FetchSingleProducts({
    required this.productId
  });

  @override
  List<Object> get props => [productId];

}