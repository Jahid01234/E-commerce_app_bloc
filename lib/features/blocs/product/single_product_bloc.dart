import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/product/single_product_state.dart';
import 'package:flutter/foundation.dart';

class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  final StoreRepository storeRepository;

  SingleProductBloc(this.storeRepository) : super(SingleProductInitial()) {

    on<FetchSingleProduct>((event, emit) async {
      emit(SingleProductLoading());
      try {
        final product = await storeRepository.fetchSingleProduct(event.productId);
        print("Fetched Product: $product");
        if(product !=null) {
          emit(SingleProductFetchSuccess(product));
        } else{
          emit(SingleProductFetchFailed('Unable to load product'));
        }
      } catch (e) {
        debugPrint("🔥 ERROR: $e");
        emit(SingleProductFetchFailed('Failed to load product'));
      }
    });

    on<ChangeProductImage>((event, emit) {
      if (state is SingleProductFetchSuccess) {
        final currentState = state as SingleProductFetchSuccess;

        emit(currentState.copyWith(
          selectedImageIndex: event.index,
        ));
      }
    });
  }
}
