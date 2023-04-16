part of 'phone_auth_bloc.dart';

@immutable
abstract class PhoneAuthEvent {}

class SendOtpToPhoneEvent extends PhoneAuthEvent
{
  String phoneNumber;
  SendOtpToPhoneEvent({required this.phoneNumber});
}

class VerifySentOtpEvent extends PhoneAuthEvent {
  final String otpCode;
  final String verificationId;
  VerifySentOtpEvent({required this.otpCode, required this.verificationId});
}

class OnPhoneOtpSent extends PhoneAuthEvent {
  final String verificationId;
  final int? token;
  OnPhoneOtpSent({required this.verificationId, required this.token,});
}

class OnPhoneAuthErrorEvent extends PhoneAuthEvent {
  final String error;
  OnPhoneAuthErrorEvent({required this.error});
}

class OnPhoneAuthVerificationCompleteEvent extends PhoneAuthEvent {
  final AuthCredential credential;
  OnPhoneAuthVerificationCompleteEvent({required this.credential,});
}
