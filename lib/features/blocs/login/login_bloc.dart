import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()){
    on<RequestEmailLogin>((event, emit) async {
      debugPrint("Email: ${event.email}, Password: ${event.password},");
      try {
        await repository.signInWithEmail(event.email, event.password).then((value) => emit(LoginSuccess()));

      } catch (e) {
        emit(LoginFailed(e.toString()));
      }
    });
  }

}