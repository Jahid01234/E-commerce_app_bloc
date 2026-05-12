import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/cart_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/add_cart_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/add_cart_state.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_event.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {
  final CartRepository cartRepository;

  AddCartBloc(this.cartRepository) : super(AddCartInitial()) {
    on<AddProductCartButton>((event, emit) async {
      emit(AddCartLoading());
      try {
        await cartRepository.addProductToCart(event.cartProduct);
        emit(AddCartProductSuccess());
      } catch (e) {
        emit(AddCartProductFailed("Failed added to cart!"));
      }
    });
  }
}
