import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../home/bottom_nav_bar.dart';
class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);
  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _keyForm = GlobalKey<FormState>();
  Color _buttonColor =Color.fromRGBO(155, 149, 239, 1);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          const Center(child: Text("تفعيل رمز العضوية",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
          IconButton(onPressed: () {  }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
        ],
      ),
      body: Stack(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.only(top: 140.0,left: 240),
                child: Text("أدخل رمز التفعيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 19,fontWeight: FontWeight.w900)),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 220,right: 2),
                child: Text("لقد قمنا بارسال رسالة الى ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 10.0,left: 130,right: 0),
                child: Text("يرجى ادخال رمز التحقق والضعط على لتأكيد",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
              ),
              const SizedBox(height: 30,),
              Center(child: otpField()),
              const SizedBox(height: 30,),
              const Padding(
                padding:  EdgeInsets.only(top: 10.0,left: 280,right: 0),
                child: Text("اعادة الإرسال",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary:  _buttonColor,
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back,color: Colors.white,),
                        Text("التالي",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget otpField() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width - 120,
      fieldWidth: 50,
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  BottomNavBar(),
            ),
          );
        });
        // if(mounted)setState(() {});
      },
    );
  }
}
