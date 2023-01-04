part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class GetUserProfileError extends UserProfileState {}

class GetUserProfileWaiting extends UserProfileState {}

class GetUserProfileSuccess  extends UserProfileState {
  UserProfile userProfile;
  GetUserProfileSuccess({required this.userProfile});
}
