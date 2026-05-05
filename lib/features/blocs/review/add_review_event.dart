import 'package:equatable/equatable.dart';

abstract class AddReviewEvent extends Equatable{
  const AddReviewEvent();

  @override
  List<Object?> get props => [];
}


class UpdateRatingPoint extends AddReviewEvent{
  final double rating;

  const UpdateRatingPoint({
    required this.rating,
  });

  @override
  List<Object?> get props => [rating];
}


class AddSubmitReviewEvent extends AddReviewEvent{
  final String reviewText;
  final String productId;

  const AddSubmitReviewEvent({
    required this.reviewText,
    required this.productId,
  });

  @override
  List<Object?> get props => [reviewText,productId];
}

class ResetReviewEvent extends AddReviewEvent {}

