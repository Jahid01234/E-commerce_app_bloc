import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable{
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}
class ProductInitial extends ProductState{}

class ProductFetchSuccess extends ProductState{
  final List<ProductModel> products;
  const ProductFetchSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductFetchFailed extends ProductState{
  final String message;
  const ProductFetchFailed(this.message);

  @override
  List<Object?> get props => [message];
}