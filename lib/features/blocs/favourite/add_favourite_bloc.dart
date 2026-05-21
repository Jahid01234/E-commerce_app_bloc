import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/favourite_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/favourite/add_favourite_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/favourite/add_favourite_state.dart';

class AddFavouriteBloc extends Bloc<AddFavouriteEvent, AddFavouriteState> {
  final FavouriteRepository favouriteRepository;

  AddFavouriteBloc(this.favouriteRepository) : super(AddFavouriteInitial()) {

    on<ToggleFavouriteEvent>((event, emit) async {
      try {
        final productId = event.favouriteProduct.product.productId;

        final isFav = await favouriteRepository.isFavourite(productId);

        await favouriteRepository.toggleFavourite(event.favouriteProduct);

        emit(FavouriteToggled(
          productId: productId,
          isFavourite: !isFav,
        ));

      } catch (e) {
        emit(AddFavouriteProductFailed("Failed to toggle favourite"));
      }
    });
  }
}