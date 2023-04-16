import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/user_profile.dart';

import 'package:m7card/model/user_profile.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileButtonPressEvent>(getUserProfile);
  }
}

getUserProfile(UserProfileButtonPressEvent event, Emitter<UserProfileState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  UserProfile userProfile =await apiProvider.getUserProfile(GET_USER_PROFILE, event.token);
  emit(GetUserProfileWaiting());
  if(userProfile.id != null)
  {
    emit(GetUserProfileSuccess(userProfile: userProfile));
  }else
  {
    emit(GetUserProfileError());
  }
}
