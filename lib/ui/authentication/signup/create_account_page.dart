import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import '../OTP_verification/otp_verification.dart';
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _keyForm = GlobalKey<FormState>();
  Color _buttonColor = Color.fromRGBO(155, 149, 239, 1);
  final countryPicker = const FlCountryCodePicker();
  String countryCode = "+90";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          const Center(child: Text("اضافة رقم الجوال",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward,size: 30,),color:const Color.fromRGBO(133, 116, 231, 1)),
        ],
      ),
      body: Stack(
        children: [
          const BackGroundColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.only(top: 140.0,left: 240),
                child: Text("الدخول لحسابك",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 19,fontWeight: FontWeight.w900)),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 15.0,left: 194,right: 2),
                child: Text("    M7 Card أهلا بك في تطبيق",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 10.0,left: 130,right: 0),
                child: Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                child: Center(
                  child: Form(
                      key: _keyForm,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,width: 330,
                            child: TextFormField(
                              onTap: (){
                                setState(() {
                                  _buttonColor = Color.fromRGBO(99, 91, 255, 1);
                                });
                              },
                              keyboardType: TextInputType.phone,
                              textAlign:TextAlign.start ,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                fillColor:const Color.fromRGBO(229, 232, 239, 1),
                                filled: true,
                                //hintText: "البريد الالكتروني أو رقم الهاتف",
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon: SizedBox(
                                  width: 80,
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:
                                      [
                                        const SizedBox(width: 5,),

                                        GestureDetector(
                                          onTap: ()async{
                                            final code = await countryPicker.showPicker(context: context);
                                            if (code != null) {
                                              setState(() {
                                                countryCode = code.dialCode;
                                              });
                                            }
                                          },
                                          child:Icon(Icons.keyboard_arrow_down_sharp),
                                        ),

                                        const SizedBox(width: 5,),
                                        Text(countryCode),
                                        const  Text("|",style: TextStyle(fontSize: 22),),
                                      ],
                                    ),
                                  )
                                ),
                                suffixIcon:const Icon(Icons.send_to_mobile_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:const StadiumBorder(),
                      primary:  _buttonColor,
                    ),
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OTPVerification(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                          onTap: (){
                          },
                        ),
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
}


/*
  GestureDetector(
                onTap: () async {
                  final code = await countryPicker.showPicker(context: context);
                  if (code != null)  print(code);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Text('Show Picker', style: const TextStyle(color: Colors.white)),
                ),

              ),
 */