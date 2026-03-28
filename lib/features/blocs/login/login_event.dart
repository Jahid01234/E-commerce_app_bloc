import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


class RequestEmailLogin extends LoginEvent {
  final String email;
  final String password;

  RequestEmailLogin({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class TogglePasswordVisibility extends LoginEvent {}