import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/bottom_nav/bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(currentIndex: 0)) {

    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(
        currentIndex: event.index,
        isNavBarVisible: true,
      ));
    });

    on<ShowNavBarEvent>((event, emit) {
      emit(state.copyWith(isNavBarVisible: true));
    });

    on<HideNavBarEvent>((event, emit) {
      emit(state.copyWith(isNavBarVisible: false));
    });
  }
}