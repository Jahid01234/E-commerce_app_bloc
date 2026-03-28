import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isPasswordVisible;

  LoginInitial({this.isPasswordVisible = false});

  @override
  List<Object?> get props => [emailController, passwordController,isPasswordVisible];
}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);

  @override
  List<Object?> get props => [message];
}