import 'package:bloc_ecommerce_app/core/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      final isCurrentlyVisible = state is RegisterInitial
          ? (state as RegisterInitial).isPasswordVisible
          : false;

      emit(RegisterInitial(isPasswordVisible: !isCurrentlyVisible));
    });
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

}