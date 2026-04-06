import 'package:bloc_ecommerce_app/features/blocs/home/home_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc():super(HomeInitial());

}