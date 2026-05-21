import 'package:equatable/equatable.dart';

abstract class AddFavouriteState extends Equatable{
  const AddFavouriteState();

  @override
  List<Object?> get props => [];
}

class AddFavouriteInitial extends AddFavouriteState{}

class AddFavouriteLoading extends AddFavouriteState{}

class FavouriteToggled extends AddFavouriteState {
  final String productId;
  final bool isFavourite;

  const FavouriteToggled({
    required this.productId,
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [productId, isFavourite];
}

class FavouriteLoaded extends AddFavouriteState {
  final Set<String> favouriteIds;

  const FavouriteLoaded(this.favouriteIds);

  @override
  List<Object?> get props => [favouriteIds];
}

class AddFavouriteProductFailed extends AddFavouriteState {
  final String message;
  const AddFavouriteProductFailed(this.message);

  @override
  List<Object?> get props => [message];
}