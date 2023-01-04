part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class UserProfileButtonPressEvent extends UserProfileEvent{
  String token;
  UserProfileButtonPressEvent({required this.token});
}