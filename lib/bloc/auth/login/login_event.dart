part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class StartEvent extends LoginEvent{}

class LoginButtonPressEvent extends LoginEvent{
  String email;
  String password;
  String token;
  LoginButtonPressEvent({required this.email, required this.password,required this.token,});
}

