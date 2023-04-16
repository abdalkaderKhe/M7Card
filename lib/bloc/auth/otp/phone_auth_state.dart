part of 'phone_auth_bloc.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState
{
  String errorMsg;
  PhoneAuthError(this.errorMsg);
}

class PhoneAuthSubmited extends PhoneAuthState {}

class PhoneAuthCodeSentSuccess extends PhoneAuthState
{
  final String verificationId;
  PhoneAuthCodeSentSuccess({required this.verificationId,});
}


class PhoneAuthVerified extends PhoneAuthState {}
