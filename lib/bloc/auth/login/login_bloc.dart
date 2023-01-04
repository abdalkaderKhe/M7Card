import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_postLogin);
  }
}

_postLogin(LoginEvent event, Emitter<LoginState> emit) async {
  ApiProvider apiProvider = ApiProvider();
    emit(LoginLoadingState());

    if (event is LoginButtonPressEvent){
      var resulte = await apiProvider.postLogin(
        "https://m7card.manarhays.com/api/v100/login",
        {
          "email" : event.email,
          "password": event.password,
        },
      );

      print(resulte["message"]);

      if(resulte["message"] == "Login Successfully"){
        emit(LoginSuccessState());
      }
      if(resulte["message"] == "Your account is not verified.Please verify your account."){
        emit(LoginAccountNotVerifiedState());
      }
      if(resulte["message"] == "User not found"){
        emit(LoginUserNotFoundState());
      }
      if(resulte["message"] == "Invalid credentials"){
        emit(LoginInvalidCredentialsState());
      }

    }



}
