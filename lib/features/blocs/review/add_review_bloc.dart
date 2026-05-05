import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/data/models/review_model.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddReviewBloc extends Bloc<AddReviewEvent, AddReviewState>{
  final StoreRepository repository;
  double rating = 0.0;
  final TextEditingController reviewTextController = TextEditingController();

  AddReviewBloc(this.repository): super(AddReviewInitial()){

    on<UpdateRatingPoint>((event, emit) {
      rating = event.rating;
    });

    on<ResetReviewEvent>((event, emit) {
      reviewTextController.clear();
      rating = 1.0;
      emit(AddReviewInitial());
    });

    on<AddSubmitReviewEvent>((event, emit) async {
      emit(AddReviewLoading());
      final currentUser = FirebaseAuth.instance.currentUser;
      final review = ReviewModel(
          userId: currentUser?.uid,
          userName: currentUser?.displayName,
          userProfileImage: currentUser?.photoURL,
          productId: event.productId,
          reviewText: event.reviewText,
          rating: rating,
          createdAt: DateTime.now(),
      );

      try {
        final response = await repository.submitProductReview(review);
        if (response != null) {
          emit(AddReviewSuccess());
        } else {
          emit(const AddReviewFailed("Can not submit review"));
        }
      } catch (e) {
        emit(const AddReviewFailed("Internal Server Error"));
      }
    });
  }

  @override
  Future<void> close() {
    reviewTextController.dispose();
    return super.close();
  }
}