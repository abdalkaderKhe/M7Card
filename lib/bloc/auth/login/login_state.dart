part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginAccountNotVerifiedState extends LoginState {}

class LoginUserNotFoundState extends LoginState {}

class LoginInvalidCredentialsState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginSuccessState();
}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
}

