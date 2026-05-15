import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc(this.repository) : super(LoginInitial()) {

    on<RequestEmailLogin>((event, emit) async {
      emit(LoginLoading());
      try {
        await repository.signInWithEmail(event.email, event.password);
        emailController.clear();
        passwordController.clear();
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailed(e.toString()));
      }
    });


    on<TogglePasswordVisibility>((event, emit) {
      final isCurrentlyVisible = state is LoginInitial
          ? (state as LoginInitial).isPasswordVisible
          : false;

      emit(LoginInitial(isPasswordVisible: !isCurrentlyVisible));
    });

    on<ClearLoginFields>((event, emit) {
      emailController.clear();
      passwordController.clear();
      emit(LoginInitial(isPasswordVisible: false));
    });

  }


  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}