import 'package:equatable/equatable.dart';

abstract class AddCartState extends Equatable{
  const AddCartState();

  @override
  List<Object?> get props => [];
}

class AddCartInitial extends AddCartState{}

class AddCartLoading extends AddCartState{}

class AddCartProductSuccess extends AddCartState{}

class AddCartProductFailed extends AddCartState{
  final String message;
  const AddCartProductFailed(this.message);


  @override
  List<Object?> get props => [message];
}
