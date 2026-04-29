import 'package:bloc_ecommerce_app/core/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class SingleProductState extends Equatable{
  const SingleProductState();

  @override
  List<Object?> get props => [];
}

class SingleProductLoading extends SingleProductState {}
class SingleProductInitial extends SingleProductState{}

class SingleProductFetchSuccess extends SingleProductState{
  final ProductModel product;
  const SingleProductFetchSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class SingleProductFetchFailed extends SingleProductState{
  final String message;
  const SingleProductFetchFailed(this.message);

  @override
  List<Object?> get props => [message];
}