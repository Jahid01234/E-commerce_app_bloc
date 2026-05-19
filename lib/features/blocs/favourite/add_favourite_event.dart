import 'package:bloc_ecommerce_app/core/data/models/favourite_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddFavouriteEvent extends Equatable{
  const AddFavouriteEvent();

  @override
  List<Object?> get props => [];
}

// class AddProductFavouriteButton extends AddFavouriteEvent{
//   final FavouriteModel favouriteProduct;
//
//   const AddProductFavouriteButton({
//     required this.favouriteProduct,
//   });
//
//   @override
//   List<Object?> get props => [favouriteProduct];
// }

class ToggleFavouriteEvent extends AddFavouriteEvent {
  final FavouriteModel favouriteProduct;

  const ToggleFavouriteEvent({required this.favouriteProduct});

  @override
  List<Object?> get props => [favouriteProduct];
}
