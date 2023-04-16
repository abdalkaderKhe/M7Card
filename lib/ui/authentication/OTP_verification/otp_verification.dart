import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/ui/authentication/signup/create_account_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../bloc/auth/otp/phone_auth_bloc.dart';
import '../../home/bottom_nav_bar.dart';
import '../signup/create_account_with_email_and_password_page.dart';

class OTPVerification extends StatefulWidget {
  String phoneNumber;
  String verificationId;
  OTPVerification({Key? key , required this.phoneNumber , required this.verificationId}) : super(key: key);
  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  final _keyForm = GlobalKey<FormState>();
  Color _buttonColor =Color.fromRGBO(155, 149, 239, 1);

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 120);

  late PhoneAuthBloc _phoneAuthBloc;

  bool phoneOtpSent = false;

  void startTimer()
  {
    countdownTimer = Timer.periodic(Duration(seconds: 1),  (_) => setCountDown());
  }

  void setCountDown()
  {
    final reduceSecondsBy = 1;

    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0)
      {
        countdownTimer!.cancel();
        phoneOtpSent = true;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CreateAccountPage(),
          ),
        );
      }
      else
      {
        myDuration = Duration(seconds: seconds);
      }
    });
  }



  @override
  void initState() {
    _phoneAuthBloc = BlocProvider.of<PhoneAuthBloc>(context);
     startTimer();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    String strDigits(int n) => n.toString().padLeft(1, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(120));


    return Scaffold(
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color.fromRGBO(247, 241, 253, 1),
                      Color.fromRGBO(247, 241, 253, 1),
                      Color.fromRGBO(241, 232, 251, 1),
                      Color.fromRGBO(206, 223, 253, 1),
                      Color.fromRGBO(206, 223, 253, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
              ),
            ),

            BlocListener<PhoneAuthBloc, PhoneAuthState>(
                listener: (BuildContext context, state)
                    {
                      if (state is PhoneAuthVerified)
                      {
                        Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => CreateAccountWithEmailAndPassword(),
                            ),
                          );
                        }
                      if (state is PhoneAuthError)
                      {
                        Navigator.pop(context);
                        String errorMsg = state.errorMsg;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg) ,
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 4),));
                      }
                    },

              child:Column(
                children: [
                  customAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height / 20,),
                        Text("أدخل رمز التفعيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 16,fontWeight: FontWeight.w900)),
                        SizedBox(height: height / 30,),
                        Text("لقد قمنا بارسال رسالة الى ",style: TextStyle(fontFamily: "Almarai",
                          color: Color.fromRGBO(73, 70, 97, 1),fontSize: 12,fontWeight: FontWeight.bold,)),
                        SizedBox(height: height / 30,),
                        Text("يرجى ادخال رمز التحقق والضعط على لتأكيد",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                          fontSize: 12,fontWeight: FontWeight.bold,)),
                        SizedBox(height: height / 30,),

                        Center(child: otpField()),

                        SizedBox(height: height / 30,),

                        Text("اعادة الإرسال",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),
                          fontSize: 13,fontWeight: FontWeight.w600,)),

                        SizedBox(height: height / 30,),

                        Text("يمكنك طلب رمز جديد بعد$seconds",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),
                          fontSize: 13,fontWeight: FontWeight.w600,)),

                        SizedBox(height: height / 30,),

                        SizedBox(
                          width: double.infinity,
                          height: height / 15,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary:  _buttonColor,
                            ),
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back,color: Colors.white,size: 22,),
                                Text("أكمال تعريف الملف الشخصي",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),)
                ],
              ),
            ),

          ],
        ),
      )
    );
  }

  Widget otpField()
  {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 120,
      fieldWidth: 35,
      otpFieldStyle: OtpFieldStyle(

        backgroundColor: Colors.grey.withOpacity(0.2),
        borderColor: Colors.transparent,
        focusBorderColor: Colors.transparent,
        enabledBorderColor :  Colors.transparent,


      ),
      style:const TextStyle(fontSize: 17, color: Color.fromRGBO(73, 70, 97, 1),),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          _buttonColor = const Color.fromRGBO(99, 91, 255, 1);
          _phoneAuthBloc.add(VerifySentOtpEvent(otpCode: pin, verificationId: widget.verificationId));
        });
        // if(mounted)setState(() {});
      },
    );
  }

  Widget customAppBar()
  {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height/20,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_back,size: 20,),
              color: Colors.transparent),
          Row(
            children: [
              Text("تفعيل رمز العضوية",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                  fontSize: 15,fontWeight: FontWeight.w900),),
             IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 20,), color: Color.fromRGBO(133, 116, 231, 1)),
            ],
          ),
        ],
      ),
    );
  }

}
