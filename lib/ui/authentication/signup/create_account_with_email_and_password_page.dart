import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/auth/register_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/ui/authentication/signin/signin_email_or_phone_page.dart';
import 'package:m7card/ui/home/bottom_nav_bar.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
class CreateAccountWithEmailAndPassword extends StatefulWidget {
  const CreateAccountWithEmailAndPassword({Key? key}) : super(key: key);
  @override
  State<CreateAccountWithEmailAndPassword> createState() => _CreateAccountWithEmailAndPasswordState();
}

class _CreateAccountWithEmailAndPasswordState extends State<CreateAccountWithEmailAndPassword> {
  final _keyForm = GlobalKey<FormState>();
  final Color _buttonColor = const Color.fromRGBO(155, 149, 239, 1);
  late RegisterBloc _registerBloc ;

  late final  TextEditingController _emailEditingController = TextEditingController();
  late final TextEditingController _passwordEditingController =  TextEditingController();
  late final TextEditingController _firstNameEditingController =  TextEditingController();
  late final TextEditingController _lastNameEditingController =  TextEditingController();

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _firstNameEditingController.dispose();
    _lastNameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (BuildContext context, state) {
        if (state is RegisterLoadingState) {
          print("=====RegisterErrorState======");
        }
        if (state is RegisterErrorState) {
           print("=====RegisterErrorState======");
        }
        if (state is RegisterSuccessCheckMailState) {
          print("=====RegisterErrorState======");
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading : false,
          actions: [
            const Center(child: Text("التسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
            IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_forward,size: 30,),color:const Color.fromRGBO(133, 116, 231, 1)),
          ],
        ),
        body: Stack(
          children: [
            const BackGroundColor(),
            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [

                    SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("الدخول لحسابك",style: Theme.of(context).textTheme.headline5!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                     Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 12),
                      child: Text("    M7 Card أهلا بك في تطبيق",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("يرجى كتابة رقم الجوال أو البريد الالكتروني",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontFamily: "Almarai",color: const Color.fromRGBO(73, 70, 97, 1))),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                      child: Center(
                        child: Form(
                            key: _keyForm,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 65,width: 330,
                                  child: TextFormField(
                                    controller: _emailEditingController,
                                    keyboardType:TextInputType.emailAddress,
                                    textAlign:TextAlign.start ,
                                    textDirection: TextDirection.rtl,
                                    validator: (text){
                                      if(text!.isNotEmpty){
                                        if (text.length > 5 && text.contains('@') && text.endsWith('.com')) {
                                            return null;
                                        }else{
                                          return "يرجى ادخل عنوان بريد الكتروني صالح";
                                        }
                                      }
                                      if(text!.isEmpty){
                                        return "يجب ادخال البريد الالكتروني";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                                      filled: true,
                                      hintText: "البريد الالكتروني",
                                      hintTextDirection: TextDirection.rtl,
                                      suffixIcon:const Icon(Icons.email),
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
                                const SizedBox(height: 15,),
                                SizedBox(
                                  height: 65,width: 330,
                                  child: TextFormField(
                                    validator: (text){
                                      if(text!.isNotEmpty){
                                        if (text.length > 4) {
                                          return null;
                                        }else{
                                          return "يجب أن تتكون كلمة المرور من 5 أحرف على الأقل";
                                        }
                                      }
                                      if(text!.isEmpty){
                                        return "يجب ادخال كلمة المرور";
                                      }
                                    },
                                    controller: _passwordEditingController,
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
                                const SizedBox(height: 15,),
                                SizedBox(
                                  height: 65,width: 330,
                                  child: TextFormField(
                                    validator: (text){
                                      if(text!.isEmpty){
                                        return "يجب ادخال الاسم الاول";
                                      }
                                    },
                                    controller: _firstNameEditingController,
                                    textAlign:TextAlign.start ,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                                      filled: true,
                                      hintText: "الاسم الاول",
                                      hintTextDirection: TextDirection.rtl,
                                      suffixIcon:const Icon(Icons.person),
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
                                const SizedBox(height: 15,),
                                SizedBox(
                                  height: 65,width: 330,
                                  child: TextFormField(
                                    validator: (text){
                                      if(text!.isEmpty){
                                        return "يجب ادخال اسم العائلة";
                                      }
                                    },
                                    controller: _lastNameEditingController,
                                    textAlign:TextAlign.start ,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                                      filled: true,
                                      hintText: "اسم العائلة",
                                      hintTextDirection: TextDirection.rtl,
                                      suffixIcon:const Icon(Icons.person),
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
                                const SizedBox(height: 15,),

                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (BuildContext context, state){
                                  if (state is RegisterLoadingState) {
                                      print("=====RegisterLoadingState======");
                                      return Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 25),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 60,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              primary: _buttonColor,
                                            ),
                                            onPressed: () {},
                                            child:const Center(child: CircularProgressIndicator(color: Color.fromRGBO(247, 241, 253, 1),),)
                                          ),
                                        ),
                                      );
                                  }
                                  if (state is RegisterSuccessCheckMailState) {
                                    print("=====RegisterSuccessCheckMailState======");
                                    //WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: "تم التسجيل بنجاح تفقد الايميل لتفعيل الحساب"));
                                    SchedulerBinding.instance.addPostFrameCallback((_){
                                      Navigator.pushReplacement(context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) => const SigninEmailOrPhonePage(),
                                        ),
                                      );
                                    });
                                    return const SizedBox();
                                  }
                                  if (state is RegisterErrorState) {
                                    print("=====RegisterErrorState======");
                                    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: ERROR_OCCURED_AR));
                                  }
                                  if (state is RegisterEmailHasAlreadyBeenTakenState) {
                                    print("=====RegisterErrorState======");
                                    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog(message: "عنوان البريد الالكتروني موجود مسبقا"));
                                  }
                                  return Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          primary: _buttonColor,
                                        ),
                                        onPressed: () {
                                          if (_keyForm.currentState!.validate()) {
                                            print("_keyForm");
                                            _registerBloc.add(
                                              RegisterButtonPressEvent(
                                                email: _emailEditingController.text,
                                                password: _passwordEditingController.text,
                                                firstName: _firstNameEditingController.text,
                                                lastName: _lastNameEditingController.text,
                                              ),
                                            );
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: const Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "تسجيل",
                                              style: TextStyle(
                                                  fontFamily: "Almarai",
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                 },
                               ),

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
                  style: TextStyle(fontFamily: "Almarai",color:Color.fromRGBO(83, 81, 94, 1),fontSize: 15,fontWeight: FontWeight.w900),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('اغلاق',style: TextStyle(fontFamily: "Almarai",color:Color.fromRGBO(83, 81, 94, 1),fontSize: 15,fontWeight: FontWeight.w900),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
