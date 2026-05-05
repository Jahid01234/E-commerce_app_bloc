import 'package:equatable/equatable.dart';

abstract class AddReviewState extends Equatable {
  const AddReviewState();

  @override
  List<Object?> get props => [];
}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {}

class AddReviewFailed extends AddReviewState {
  final String message;
  const AddReviewFailed(this.message);

  @override
  List<Object?> get props => [message];
}