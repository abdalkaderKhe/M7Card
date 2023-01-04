import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/auth/login/login_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/ui/authentication/change-password/change-password_page.dart';
import 'package:m7card/ui/authentication/signup/create_account_with_email_and_password_page.dart';
import 'package:m7card/ui/home/bottom_nav_bar.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/home.dart';
import '../signup/create_account_page.dart';
class SigninEmailOrPhonePage extends StatefulWidget {
  const SigninEmailOrPhonePage({Key? key}) : super(key: key);
  @override
  State<SigninEmailOrPhonePage> createState() => _SigninEmailOrPhonePageState();
}

class _SigninEmailOrPhonePageState extends State<SigninEmailOrPhonePage> {

  final _keyForm = GlobalKey<FormState>();
  late final  TextEditingController _emailEditingController = TextEditingController();
  late final  TextEditingController _passwordEditingController =  TextEditingController();
  late LoginBloc _loginBloc;

  final prefs = SharedPreferences.getInstance();
  late final bool? repeat;

  bool loginButtonPress = false;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, state)
      {
        if(state is LoginErrorState)
        {
          "error";
        }
        if(state is LoginSuccessState)
        {
          print("LoginSuccessState");
        }
      },

      child: Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          automaticallyImplyLeading : false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title:  Padding(
            padding: const EdgeInsets.only(right: 60),
            child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                  );
                },
                child:const Center(child: Text("تصفح بدون تسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(83, 81, 94, 1),fontSize: 15,fontWeight: FontWeight.bold),)
                ),
            ),
          ),
          actions: [
             const Center(child: Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
             IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
          ],
        ),
        /*
                    const Padding(
                      padding:  EdgeInsets.only(top: 140.0,left: 240),
                      child: Text("الدخول لحسابك",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 19,fontWeight: FontWeight.w900)),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(top: 15.0,left: 200,right: 0),
                      child: Text("M7 Card أهلا بك في تطبيق",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 130,right: 0),
                      child: Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.bold,)),
                    ),
 */
        body: Stack(
          children: [
            const BackGroundColor(),
            SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                    SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                    //                    const Text("الدخول لحسابك     ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 19,fontWeight: FontWeight.w900)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("الدخول لحسابك",style: Theme.of(context).textTheme.headline5!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                       child: Text("M7 Card أهلا بك في تطبيق",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                     ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                       child: Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                     ),

                    const SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 65,width: 330,
                              child: TextFormField(
                                controller: _emailEditingController,
                                validator: (text){
                                  if(text!.isNotEmpty){
                                    if (text.length > 5 && text.contains('@') && text.endsWith('.com')) {
                                      return null;
                                    }else{
                                      return "يرجى ادخل عنوان بريد الكتروني صالح";
                                    }
                                  }
                                  if(text.isEmpty){
                                    return "يجب ادخال البريد الالكتروني";
                                  }
                                },
                                textAlign:TextAlign.start ,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  fillColor:const Color.fromRGBO(229, 232, 239, 1),
                                  filled: true,
                                  hintText: "البريد الالكتروني أو رقم الهاتف",
                                  hintTextDirection: TextDirection.rtl,
                                  suffixIcon: Icon(Icons.person),
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
                            SizedBox(
                              height: 65,width: 330,
                              child: TextFormField(
                                controller: _passwordEditingController,
                                validator: (text){
                                  if(text!.isNotEmpty){
                                    if (text.length > 4) {
                                      return null;
                                    }else{
                                      return "يجب أن تتكون كلمة المرور من 5 أحرف على الأقل";
                                    }
                                  }
                                  if(text.isEmpty){
                                    return "يجب ادخال كلمة المرور";
                                  }
                                },
                                textAlign:TextAlign.start ,
                                textDirection: TextDirection.rtl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                                  filled: true,
                                  hintText: "كلمة المرور",
                                  hintTextDirection: TextDirection.rtl,
                                  suffixIcon:const Icon(Icons.key),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
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
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),

                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => const ChangePasswordPage(),
                                ),
                              );
                            },
                            child:const Text("استعادة  ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),fontSize: 15,fontWeight: FontWeight.bold,)),
                          ),
                          const Text("?نسيت كلمة المرور",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.bold,)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),


                    BlocBuilder<LoginBloc,LoginState>(
                        builder: (context,state){
                          if(state is LoginLoadingState){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape:const StadiumBorder(),
                                    primary:const  Color.fromRGBO(155, 149, 239, 1),
                                  ),
                                  onPressed: () {  },
                                  child:const Center(child: CircularProgressIndicator(color: Color.fromRGBO(247, 241, 253, 1),),)
                                ),
                              ),
                            );
                          }
                          if(state is LoginErrorState) {
                            return const Center(
                                child: Text(
                                    ERROR_OCCURED_AR,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: BLACK_GREY,
                                    ))
                            );
                          }
                          if(state is LoginUserNotFoundState && loginButtonPress == true)
                          {
                            loginButtonPress = false;
                            WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: "اسم المستخدم غير موجود"));
                          }
                          if(state is LoginAccountNotVerifiedState && loginButtonPress == true)
                          {
                             loginButtonPress = false;
                             WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: ACCOUNT_NOT_VERIFIED_STATE_AR));
                          }
                          if(state is LoginInvalidCredentialsState && loginButtonPress == true)
                          {
                            loginButtonPress = false;
                            //بيانات الاعتماد غير صالحة
                            WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: "البريد الالكتروني او كلمة المرور غير صالحة"));
                          }
                          if(state is LoginSuccessState && loginButtonPress == true)
                          {
                            SchedulerBinding.instance.addPostFrameCallback((_){
                              Navigator.pushReplacement(context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => const BottomNavBar(),
                                ),
                              );
                            });
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape:const StadiumBorder(),
                                  primary:const  Color.fromRGBO(155, 149, 239, 1),
                                ),
                                onPressed: (){
                                  if (_keyForm.currentState!.validate()) {
                                     loginButtonPress = true;
                                    _loginBloc.add(
                                      LoginButtonPressEvent(
                                        email: _emailEditingController.text,
                                        password: _passwordEditingController.text,
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:const [
                                    Icon(Icons.arrow_back,color: Colors.white,),
                                    Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),

                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CreateAccountWithEmailAndPassword(),
                                ),
                              );
                            },
                            child:const Text("انشاء حساب  ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),fontSize: 15,fontWeight: FontWeight.bold,)),
                          ),
                          const Text("?ليس لديك حساب",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.bold,)),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
   _showMyDialog({required String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children:[
                Text(message,
                  style: const TextStyle(fontFamily: "Almarai",color:Color.fromRGBO(83, 81, 94, 1),fontSize: 15,fontWeight: FontWeight.w900),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('اغلاق',style: TextStyle(fontFamily: "Almarai",color:Color.fromRGBO(83, 81, 94, 1),fontSize: 15,fontWeight: FontWeight.w900),),
              onPressed: () {
                loginButtonPress = false;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}






































/*
                    //أو استخدم
                    /*
                    const SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            color: Colors.white,
                            width: 150,
                          ),
                          const Text("أو استخدم",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.bold,)),

                          Container(
                            height: 1,
                            color: Colors.white,
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                     */
                    // twitter facebook google
                   /*
                    const SizedBox(height: 10,),
                    // twitter facebook google
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.all(18),
                              shape:const CircleBorder(),
                              primary:const  Color.fromRGBO(229, 232, 241, 1),
                            ),
                            onPressed: (){},
                            child:const Icon(FontAwesomeIcons.google,color: Color.fromRGBO(78, 77, 108, 1),size: 35,),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.all(18),
                              shape:const CircleBorder(),
                              primary: const Color.fromRGBO(229, 232, 241, 1),
                            ),
                            onPressed: (){},
                            child:const Icon(FontAwesomeIcons.facebook,color: Color.fromRGBO(78, 77, 108, 1),size: 35,),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.all(18),
                              shape:const CircleBorder(),
                              primary:const  Color.fromRGBO(229, 232, 241, 1),
                            ),
                            onPressed: (){},
                            child:const Icon(FontAwesomeIcons.twitter,color: Color.fromRGBO(78, 77, 108, 1),size: 35,),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),
 */
 */



/*
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
 */




