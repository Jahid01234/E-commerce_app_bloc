import 'package:bloc_ecommerce_app/core/data/models/review_model.dart';
import 'package:equatable/equatable.dart';


abstract class ReviewState extends Equatable{
  const ReviewState();

  @override
  List<Object?> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {
  final List<ReviewModel> reviews;
  const ReviewSuccess(this.reviews);

  @override
  List<Object?> get props => [reviews];
}

class ReviewFailed extends ReviewState {
  final String message;
  const ReviewFailed(this.message);

  @override
  List<Object?> get props => [message];
}