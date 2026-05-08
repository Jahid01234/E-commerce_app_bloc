import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc(): super(CartInitial());
}