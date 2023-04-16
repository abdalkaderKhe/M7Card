import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  PhoneAuthBloc() : super(PhoneAuthInitial()) {

    late String _verificationId;
    final auth = FirebaseAuth.instance;

    // When user clicks on send otp button then this event will be fired
    on<SendOtpToPhoneEvent>(_onSendOtp);

    // After receiving the otp, When user clicks on verify otp button then this event will be fired
    on<VerifySentOtpEvent>(_onVerifyOtp);

    // When the firebase sends the code to the user's phone, this event will be fired
    on<OnPhoneOtpSent>((event, emit) => emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    // When any error occurs while sending otp to the user's phone, this event will be fired
    on<OnPhoneAuthErrorEvent>((event, emit) => emit(PhoneAuthError(event.error)));

    // When the otp verification is successful, this event will be fired
    on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);

  }

  FutureOr<void> _onSendOtp(SendOtpToPhoneEvent event, Emitter<PhoneAuthState> emit) async
  {

    emit(PhoneAuthLoading());

    try
    {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async
        {
          print("verificationCompleted");
          add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
        },
        codeSent: (String verificationId, int? resendToken)
        {
          print("codeSent");
          add(OnPhoneOtpSent(verificationId: verificationId, token: resendToken));
        },
        verificationFailed: (FirebaseAuthException e)
        {
          print("verificationFailed");
          add(OnPhoneAuthErrorEvent(error: e.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    catch (e)
    {
      print("PhoneAuthError");
      emit(PhoneAuthError(e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(VerifySentOtpEvent event, Emitter<PhoneAuthState> emit) async
  {
    try {
      emit(PhoneAuthLoading());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(PhoneAuthError(e.toString()));
    }
  }

  FutureOr<void> _loginWithCredential(OnPhoneAuthVerificationCompleteEvent event, Emitter<PhoneAuthState> emit) async
  {
    // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
    try {
      await FirebaseAuth.instance.signInWithCredential(event.credential).then((user) {
        if (user.user != null) {
          emit(PhoneAuthVerified());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthError(e.code));
    } catch (e) {
      emit(PhoneAuthError(e.toString()));
    }
  }


}






FutureOr<void> _otpAuth(PhoneAuthEvent event, Emitter<PhoneAuthState> emit) async
{

  late String _verificationId;
  bool codeSent = false;

  Future<void> CodeSent()async
  {
    // print("codeSent");
     //print(verificationId);
   // _verificationId = verificationId;
      emit(PhoneAuthError("e.toString()"));
  }

  Future<void> submitOTP(String otpCode)async
  {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otpCode);
    try
    {
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    }
    catch(error)
    {
      emit(PhoneAuthError(error.toString()));
    }
  }

  User _getLoggedInUserDate()
  {
    return FirebaseAuth.instance.currentUser!;
  }


  if(event is SendOtpToPhoneEvent)
    {
      emit(PhoneAuthLoading());

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        timeout: const Duration(seconds: 120),

        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
        {
          print("verificationCompleted");
          try
          {
            await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
          }
          catch(error)
          {
            emit(PhoneAuthError(error.toString()));
          }
        },

        verificationFailed: (FirebaseAuthException e) async
        {
            print("Firebase Auth Exception $e");
            await CodeSent();
          },

        //   {
     //   print("Firebase Auth Exception $e");
        //emit(PhoneAuthError(e.toString()));
     //   },

        codeSent: await (verificationId, forceResendingToken) => { _verificationId = verificationId , emit(PhoneAuthSubmited()) },

        codeAutoRetrievalTimeout: (String verificationId)
        {
          print("codeAutoRetrievalTimeout");
        },

      );
    }


}










