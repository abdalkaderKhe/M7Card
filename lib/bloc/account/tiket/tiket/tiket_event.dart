part of 'tiket_bloc.dart';

@immutable
abstract class TiketEvent {}

class SubmitTiketButtonPressEvent extends TiketEvent{
  String token;
  UserProfile userProfile;
  SubmitTiketButtonPressEvent({required this.token, required this.userProfile});
}
