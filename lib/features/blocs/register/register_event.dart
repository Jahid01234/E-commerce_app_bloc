import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


class RequestEmailRegister extends RegisterEvent {
  final String userName;
  final String email;
  final String password;

  RequestEmailRegister({
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [userName, email, password];
}

class TogglePasswordVisibilityRegister extends RegisterEvent {}