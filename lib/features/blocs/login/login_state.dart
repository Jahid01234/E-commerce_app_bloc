import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final bool isPasswordVisible;
  LoginInitial({this.isPasswordVisible = false});

  LoginInitial copyWith({bool? isPasswordVisible}) {
    return LoginInitial(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
   LoginFailed(this.message);

  @override
  List<Object?> get props => [message];
}