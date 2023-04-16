import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m7card/bloc/auth/login/login_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/ui/authentication/change-password/change-password_page.dart';
import 'package:m7card/ui/authentication/signup/create_account_with_email_and_password_page.dart';
import 'package:m7card/ui/home/bottom_nav_bar.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bloc/account/user_profile/user_profile_bloc.dart';
import '../../../main.dart';
import '../../../model/user_profile.dart';
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

  late UserProfile userProfile ;
  late UserProfileBloc _userProfileBloc;
  String? _token;

  Future<String?> _getToken() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token')!;
    return _token;
  }

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MultiBlocListener(
      listeners:
      [
        BlocListener<UserProfileBloc, UserProfileState>(
            listener: (BuildContext context, state) {
          if (state is GetUserProfileWaiting) {
            print("GetUserProfileWaiting");
          }
          if (state is GetUserProfileError) {
            print("GetUserProfileError");
          }
          if (state is GetUserProfileSuccess) {
            LandingPage.userProfile = state.userProfile;
            LandingPage.isCheck= true;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  BottomNavBar()
              ), (Route<dynamic> route) => false);
            });
          }
        }),
        BlocListener<LoginBloc, LoginState>(
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
        ),

      ],
      child: Scaffold(
      extendBodyBehindAppBar: true,
      /*
        appBar: AppBar(
          automaticallyImplyLeading : false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(),
                ),
              );
            },
            child:const Center(child: Text("تصفح بدون تسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(83, 81, 94, 1),fontSize: 13,fontWeight: FontWeight.w600),)
            ),
          ),
          actions: [
             const Center(child: Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
             IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
          ],
        ),
        */
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
      body: SafeArea(
        child: Stack(
          children: [
            const BackGroundColor(),
            SingleChildScrollView(
              child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      customAppBar(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(height: height / 20),

                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("الدخول لحسابك",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1),fontWeight: FontWeight.w900)),
                                  SizedBox(height: height / 40),
                                  Text("M7 Card أهلا بك في تطبيق",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                                  SizedBox(height: height / 70),
                                  Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                                ],
                              ),
                            ),

                            /*
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("الدخول لحسابك",style: Theme.of(context).textTheme.headline5!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                      ),
                       */
                            /*
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
                       */

                            SizedBox(height: height / 25),

                            Column(
                              children: [
                                SizedBox(
                                  height: height / 14,
                                  width: width / 1.2,
                                  child: TextFormField(
                                    controller: _emailEditingController,
                                    validator: (text)
                                    {
                                      if(text!.isNotEmpty){
                                        if (text.length > 5 && text.contains('@') && text.endsWith('.com')) {
                                          return null;
                                        }
                                        /*
                                    else
                                    {
                                      return "يرجى ادخل عنوان بريد الكتروني صالح";
                                    }
                                    */
                                      }
                                      /*
                                  if(text.isEmpty)
                                  {
                                    return "يجب ادخال البريد الالكتروني";
                                  }
                                   */
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
                                SizedBox(height: height / 70,),
                                SizedBox(
                                  height: height / 14,
                                  width: width / 1.2,
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

                            SizedBox(height: height / 50,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => const ChangePasswordPage(),
                                      ),
                                    );
                                  },
                                  child:const Text("استعادة  ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),fontSize: 14,fontWeight: FontWeight.w700,)),
                                ),
                                const Text("?نسيت كلمة المرور",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 14,fontWeight: FontWeight.w700,)),
                              ],
                            ),

                            SizedBox(height: height / 25,),

                            BlocBuilder<LoginBloc,LoginState>(
                                builder: (context,state){
                                  if(state is LoginLoadingState){
                                    return SizedBox(
                                      width: width / 1.2,
                                      height: height / 14,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom
                                            (
                                            shape:const StadiumBorder(),
                                            primary:const  Color.fromRGBO(155, 149, 239, 1),
                                          ),
                                          onPressed: () {  },
                                          child:const Center(child: CircularProgressIndicator(color: Color.fromRGBO(247, 241, 253, 1),),)
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
                                    _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
                                    _userProfileBloc.add(UserProfileButtonPressEvent(token: state.token));
                                  }

                                  return SizedBox(
                                    width: width / 1.2,
                                    height: height / 14,
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
                                              token: '',
                                            ),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:const [
                                          Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                                          Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",
                                              color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),

                            SizedBox(height: height / 25,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const CreateAccountWithEmailAndPassword(),
                                      ),
                                    );
                                  },
                                  child:const Text("انشاء حساب  ",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),
                                    fontSize: 14,fontWeight: FontWeight.w600,)),
                                ),
                                const Text("?ليس لديك حساب",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                                  fontSize: 14,fontWeight: FontWeight.w600,)),
                              ],
                            ),

                            SizedBox(height: height / 25,),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CreateAccountPage(),
                                  ),
                                );
                              },
                              child:const Text("انشاء حساب باستخدام رقم الهاتف ",
                                  style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(162, 140, 205, 1),fontSize: 13,fontWeight: FontWeight.w600,)),
                            ),


                            SizedBox(height: height / 6.5,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Color.fromRGBO(229, 232, 239, 1),
                                  width: 130,
                                  height:1.5,
                                ),

                                Text("أو استخدم",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1)),),

                                Container(
                                  color: Color.fromRGBO(229, 232, 239, 1),
                                  width: 130,
                                  height: 1.5,
                                ),
                              ],
                            ),

                            SizedBox(height: height / 50,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await signInWithGoogle().whenComplete((){
                                      Navigator.pushReplacement(context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) => const BottomNavBar(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color.fromRGBO(229, 232, 239, 1),
                                      ),
                                      padding: EdgeInsets.all(0),
                                      height: height / 14,
                                      width: width / 7,
                                      child: Center(child: Icon(FontAwesomeIcons.google,size: 30,color:const Color.fromRGBO(73, 70, 97, 1),),)
                                  ),
                                ),
                                SizedBox(width: width / 20,),
                                GestureDetector(
                                  onTap: ()async {
                                    await signInWithFacebook().whenComplete(() {
                                      Navigator.pushReplacement(context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) => const BottomNavBar(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromRGBO(229, 232, 239, 1),
                                    ),
                                    padding: EdgeInsets.all(0),
                                    height: height / 14,
                                    width: width / 7,
                                    child: Icon(FontAwesomeIcons.facebook,size: 30,color:const Color.fromRGBO(73, 70, 97, 1),),
                                  ),
                                ),
                                SizedBox(width: width / 20,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromRGBO(229, 232, 239, 1),
                                  ),
                                  padding: EdgeInsets.all(0),
                                  height: height / 14,
                                  width: width / 7,
                                  child: Icon(FontAwesomeIcons.twitter,size: 30,color:const Color.fromRGBO(73, 70, 97, 1),),
                                ),
                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  )
              ),

            ),
          ],
        ),
      ),
    ),);
  }

  /*
   appBar: AppBar(
          automaticallyImplyLeading : false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(),
                ),
              );
            },
            child:const Center(child: Text("تصفح بدون تسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(83, 81, 94, 1),fontSize: 13,fontWeight: FontWeight.w600),)
            ),
          ),
          actions: [
             const Center(child: Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
             IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
          ],
        ),
   */

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
          Padding(padding: EdgeInsets.symmetric(horizontal: width / 20),child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(),
                ),
              );
            },
            child:const Center(child: Text("تصفح بدون تسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(83, 81, 94, 1),fontSize: 13,fontWeight: FontWeight.w600),)
            ),
          ),),
          Row(
            children: [
              const Center(child: Text("تسجيل الدخول",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.w900),)),
              IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 25,),color: Color.fromRGBO(133, 116, 231, 1)),
            ],
          ),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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




