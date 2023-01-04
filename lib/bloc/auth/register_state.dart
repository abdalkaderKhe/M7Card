part of 'register_bloc.dart';

@immutable

abstract class RegisterState {

}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

//class RegisterSuccessState extends RegisterState {}

class IsLogin extends RegisterState{
  late bool isLogin;
  IsLogin(isLogin);
}

class RegisterSuccessCheckMailState extends RegisterState {}

class RegisterEmailHasAlreadyBeenTakenState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String message;
  RegisterErrorState({required this.message});
}
