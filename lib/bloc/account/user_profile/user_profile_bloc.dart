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
 // String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbTdjYXJkLm1hbmFyaGF5cy5jb21cL2FwaVwvdjEwMFwvbG9naW4iLCJpYXQiOjE2NjgwODQxMDIsIm5iZiI6MTY2ODA4NDEwMiwianRpIjoiRnBxdzVYaFVkbjkyczYwcyIsInN1YiI6OSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsImlkIjo5LCJuYW1lIjpudWxsLCJlbWFpbCI6InlzZmFsb3VzaDNAZ21haWwuY29tIiwiY3JlYXRlZF9hdCI6IjIwMjItMTEtMDZUMTE6MTY6MzAuMDAwMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIyLTExLTEwVDEyOjQxOjI1LjAwMDAwMFoifQ.cowAxc3Faf2xdiNQAbvYvlFpeKdJjiw0967juV00iJQ';
  //String url="https://m7card.manarhays.com/api/v100/user/profile?token=";
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
