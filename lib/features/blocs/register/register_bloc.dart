import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;

  RegisterBloc(this.repository) : super(RegisterInitial()){

    on<RequestEmailRegister>((event, emit) async {
      debugPrint("UserName: ${event.userName},Email: ${event.email}, Password: ${event.password},");
      try {
        await repository.signUpWithEmail(event.userName,event.email, event.password).then((value) => emit(RegisterSuccess()));
      } catch (e) {
        emit(RegisterFailed(e.toString()));
      }
    });

    on<TogglePasswordVisibilityRegister>((event, emit) {
      if (state is RegisterInitial) {
        final currentState = state as RegisterInitial;
        final newState = RegisterInitial(
          isPasswordVisible: !currentState.isPasswordVisible,
        );
        newState.userNameController.text = currentState.userNameController.text;
        newState.emailController.text = currentState.emailController.text;
        newState.passwordController.text = currentState.passwordController.text;
        emit(newState);
      }
    });


  }

}