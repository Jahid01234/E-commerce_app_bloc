import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object?> get props => [];
}


class RequestEmailRegister extends RegisterEvent {
  final String email;
  final String password;

  RequestEmailRegister({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class TogglePasswordVisibility extends RegisterEvent {}