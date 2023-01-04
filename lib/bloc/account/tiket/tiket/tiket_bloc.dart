import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'tiket_event.dart';
part 'tiket_state.dart';

class TiketBloc extends Bloc<TiketEvent, TiketState> {
  TiketBloc() : super(TiketInitial()) {
    on<SubmitTiketButtonPressEvent>(postTiket);
  }
}

postTiket(SubmitTiketButtonPressEvent event, Emitter<TiketState> emit) async
{
  ApiProvider apiProvider = ApiProvider();
  emit(PostTiketWaiting());
  try {
    await apiProvider.postTiket(url: POST_TIKET, body: event.userProfile, token: event.token,);
    emit(PostTiketSuccess());
  }
  catch (ex)
  {
    if(ex != 'cancel')
    {
      emit(PostTiketError(errorMessage: ex.toString()));
    }
  }

}
