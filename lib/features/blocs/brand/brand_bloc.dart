import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/core/repository/store_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_state.dart';
import 'package:flutter/material.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final StoreRepository storeRepository;

  BrandBloc(this.storeRepository) : super(BrandInitial()) {
    on<FetchBrands>((event, emit) async {
      emit(BrandLoading());
      try {
        final brands = await storeRepository.fetchBrands();
        emit(BrandFetchSuccess(brands));
      } catch (e) {
        debugPrint("🔥 ERROR: $e");
        emit(BrandFetchFailed('Failed to load Brands'));
      }
    });
  }
}
