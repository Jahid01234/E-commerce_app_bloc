import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isPasswordVisible;

  RegisterInitial({this.isPasswordVisible = false});

  @override
  List<Object?> get props => [emailController, passwordController,isPasswordVisible];
}

class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed(this.message);

  @override
  List<Object?> get props => [message];
}