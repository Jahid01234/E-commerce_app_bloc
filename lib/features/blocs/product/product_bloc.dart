import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/product_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/product_state.dart';
import 'package:flutter/material.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final StoreRepository storeRepository;

  ProductBloc(this.storeRepository) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await storeRepository.fetchProducts();
        emit(ProductFetchSuccess(product));
      } catch (e) {
        debugPrint("🔥 ERROR: $e");
        emit(ProductFetchFailed('Failed to load Brands'));
      }
    });
  }
}
