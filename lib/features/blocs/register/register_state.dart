import 'package:equatable/equatable.dart';


abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  final bool isPasswordVisible;

  RegisterInitial({this.isPasswordVisible = false});


  RegisterInitial copyWith({bool? isPasswordVisible}) {
    return RegisterInitial(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible];
}

class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed(this.message);

  @override
  List<Object?> get props => [message];
}