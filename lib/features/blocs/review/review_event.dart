import 'package:equatable/equatable.dart';


class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class FetchReviews extends ReviewEvent{
  final String productId;

  const FetchReviews({required this.productId});

  @override
  List<Object> get props => [productId];
}