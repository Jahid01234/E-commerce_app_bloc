import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/cart_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_state.dart';
import 'package:flutter/material.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {

    on<FetchCartProduct>((event, emit) async {
      emit(CartLoading());
      try {
        final result = await cartRepository.fetchProductsFromCart();
        emit(CartProductSuccess(result));
        debugPrint("Cart product................:$result");
      } catch (e) {
        emit(CartProductFailed("Failed added to cart!"));
      }
    });

    on<RemoveCartProduct>((event, emit) async {
      try {
        await cartRepository.removeProductFromCart(event.productId);
        add(FetchCartProduct());
      } catch (e) {
        emit(const CartProductFailed("Failed to remove item"));
      }
    });
  }
}

