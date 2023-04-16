import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import '../../../bloc/auth/otp/phone_auth_bloc.dart';
import '../OTP_verification/otp_verification.dart';
import 'package:country_picker/country_picker.dart';
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  final _keyForm = GlobalKey<FormState>();
  Color _buttonColor = Color.fromRGBO(155, 149, 239, 1);
  FlCountryCodePicker countryPicker = FlCountryCodePicker();

  final countryPickerWithParams = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showFavoritesIcon: true,
    showSearchBar: true,
  );

  String countryCode = "90";

  String phoneNuber = "";

  TextEditingController _phoneNumberController = TextEditingController();

  late PhoneAuthBloc _phoneAuthBloc;

  @override
  void initState() {
    _phoneAuthBloc = BlocProvider.of<PhoneAuthBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      extendBodyBehindAppBar: false,

      body: SafeArea(
        child: Stack(
          children: [
            const BackGroundColor(),
            Column(
              children: [
                customAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height/16,),
                      Text("الدخول لحسابك",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                          fontSize: 17,fontWeight: FontWeight.w800)),
                      SizedBox(height: height/30,),
                      Text("    M7 Card أهلا بك في تطبيق",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 12,fontWeight: FontWeight.w600,)),
                      SizedBox(height: height/30,),
                      Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 12,fontWeight: FontWeight.w600,)),

                      SizedBox(height: height/30,),

                      Center(
                        child: Form(
                            key: _keyForm,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height/15,
                                  width: width / 1.1,
                                  child: TextFormField(
                                    controller: _phoneNumberController,
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
                                      // +90
                                      prefixIcon: GestureDetector(
                                        onTap: ()
                                        {
                                          showCountryPicker(
                                            context: context,
                                            showPhoneCode: true, // optional. Shows phone code before the country name.
                                            onSelect: (Country country) {
                                              print('Select country: ${country.displayName}');
                                              setState(() {
                                                countryCode = country.phoneCode;
                                              });
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                            width: width / 5,
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children:
                                                [
                                                  SizedBox(width: width / 50,),

                                                  GestureDetector(
                                                    onTap: ()async{},
                                                    child:Icon(Icons.keyboard_arrow_down_sharp),
                                                  ),

                                                  SizedBox(width: width / 50,),
                                                  Text(countryCode),
                                                  const  Text("|",style: TextStyle(fontSize: 22),),
                                                ],
                                              ),

                                            )
                                        ),
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
                                SizedBox(height: height / 40,),
                              ],
                            )
                        ),
                      ),


                  BlocListener<PhoneAuthBloc, PhoneAuthState>
                    (
                      listener: (BuildContext context, state)
                      {
                        if (state is PhoneAuthLoading)
                        {
                          showProgressIndicator(context);
                        }
                        if (state is PhoneAuthCodeSentSuccess)
                        {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OTPVerification(
                                phoneNumber:phoneNuber,
                                verificationId: state.verificationId,),
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
                    child:SizedBox(
                      width: double.infinity,
                      height: height / 15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape:const StadiumBorder(),
                          primary:  _buttonColor,
                        ),
                        onPressed: (){
                          phoneNuber = '+' + countryCode + _phoneNumberController.text;
                          _phoneAuthBloc.add(
                            SendOtpToPhoneEvent
                              (
                                phoneNumber: phoneNuber
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                              onTap: ()
                              {},
                            ),
                            Text("التالي",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)
                          ],
                        ),
                      ),
                    ),
                  ),





                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
          IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_back,size: 25,), color: Colors.transparent),
          Row(
            children: [
              Text("اضافة رقم الجوال",style: TextStyle(fontFamily: "Almarai",
                  color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.w900),) ,
              IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 25,), color: Color.fromRGBO(133, 116, 231, 1)),
            ],
          ),
        ],
      ),
    );
  }

  void showProgressIndicator(BuildContext context)
  {
   AlertDialog alertDialog =  AlertDialog(
     backgroundColor: Colors.transparent,
     elevation: 0,
     content: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),),),
   );
   showDialog(
       context: context,
       builder: (context){return alertDialog;},
       barrierColor: Colors.white.withOpacity(0),
       barrierDismissible: false,
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