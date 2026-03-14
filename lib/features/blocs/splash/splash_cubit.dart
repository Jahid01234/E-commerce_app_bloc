import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(SplashInitial());


  Future<void> redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2),() {
         emit(SplashEnd());
    });
  }

}