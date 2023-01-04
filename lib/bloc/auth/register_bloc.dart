import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>(_postRegister);
  }

}

_postRegister(RegisterEvent event, Emitter<RegisterState> emit) async {
  ApiProvider apiProvider = ApiProvider();


  emit(RegisterLoadingState());

    if (event is RegisterButtonPressEvent){

        var resulte = await apiProvider.postRegister(
           "https://m7card.manarhays.com/api/v100/register",
           {
             "email" : event.email,
             "password": event.password,
             "first_name": event.firstName,
             "last_name": event.lastName,
           },
         );


        if(resulte["message"] == "Check your mail to verify your account")
        {
          emit(RegisterSuccessCheckMailState());
        }

        if(resulte["data"]["email"][0] == "The email has already been taken."){
          emit(RegisterEmailHasAlreadyBeenTakenState());
        }

        /*
        if(resulte["message"].toString() == "Invalid credentials")
        {
          if(resulte["data"]["email"].toString() == "The email has already been taken."){
             emit(RegisterEmailHasAlreadyBeenTakenState());
          }
          emit(RegisterErrorState(message: ''));
        }

 */
    }


}
