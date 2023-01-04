part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class StartEvent extends RegisterEvent{}

class RegisterButtonPressEvent extends RegisterEvent{
  String email;
  String password;
  String firstName;
  String lastName;
  RegisterButtonPressEvent({required this.email, required this.password,required this.firstName,required this.lastName});
}

