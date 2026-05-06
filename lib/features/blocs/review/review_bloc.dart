import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/review_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/review_state.dart';
import 'package:flutter/material.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final StoreRepository repository;

  ReviewBloc(this.repository) : super(ReviewInitial()) {
    on<FetchReviews>((event, emit) async {
      emit(ReviewLoading());
      try {
        final reviews = await repository.fetchProductReviews(event.productId);
        emit(ReviewSuccess(reviews));
        debugPrint(reviews.toString());
      } catch (e) {
        emit(const ReviewFailed("Internal Server Error"));
      }
    });

  }
}
