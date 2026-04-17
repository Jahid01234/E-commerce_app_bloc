import 'package:bloc_ecommerce_app/core/data/models/brand_model.dart';
import 'package:equatable/equatable.dart';

class BrandState extends Equatable{
  const BrandState();

  @override
  List<Object?> get props => [];
}

class BrandLoading extends BrandState {}
class BrandInitial extends BrandState{}

class BrandFetchSuccess extends BrandState{
  final List<BrandModel> brands;
  const BrandFetchSuccess(this.brands);

  @override
  List<Object?> get props => [brands];
}

class BrandFetchFailed extends BrandState{
  final String message;
  const BrandFetchFailed(this.message);

  @override
  List<Object?> get props => [message];
}