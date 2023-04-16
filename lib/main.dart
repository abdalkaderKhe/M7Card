import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/bloc/auth/login/login_bloc.dart';
import 'package:m7card/bloc/auth/otp/phone_auth_bloc.dart';
import 'package:m7card/bloc/auth/register_bloc.dart';
import 'package:m7card/bloc/category/products_by_category/products_by_category_bloc.dart';
import 'package:m7card/bloc/drawer/game_categories/game_categories_bloc.dart';
import 'package:m7card/bloc/home/slider/slider_bloc.dart';
import 'package:m7card/bloc/order/user_orders_bloc.dart';
import 'package:m7card/bloc/payment/order_payment/order_payment_bloc.dart';
import 'package:m7card/bloc/payment/payment_by_category/payment_by_category_bloc.dart';
import 'package:m7card/bloc/payment/payment_category/payment_category_bloc.dart';
import 'package:m7card/bloc/shop/all_shops/all_shops_bloc.dart';
import 'package:m7card/model/payment_category.dart';
import 'package:m7card/ui/account/add_coupon_code.dart';
import 'package:m7card/ui/account/add_new_technical_support_ticket.dart';
import 'package:m7card/ui/account/direct_technical_support_chat.dart';
import 'package:m7card/ui/authentication/OTP_verification/otp_verification.dart';
import 'package:m7card/ui/authentication/signin/signin_email_or_phone_page.dart';
import 'package:m7card/ui/authentication/signup/create_account_page.dart';
import 'package:m7card/ui/authentication/signup/create_account_with_email_and_password_page.dart';
import 'package:m7card/ui/home/bottom_nav_bar.dart';
import 'package:m7card/ui/home/category_page.dart';
import 'package:m7card/ui/home/home.dart';
import 'package:m7card/ui/home/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/account/tiket/tiket/tiket_bloc.dart';
import 'bloc/category/all_category/all_category_bloc.dart';
import 'bloc/shop/products_by_shop/products_by_shop_bloc.dart';
import 'model/user_profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllCategoryBloc>(
          create: (BuildContext context) => AllCategoryBloc(),
        ),
        BlocProvider<AllShopsBloc>(
          create: (BuildContext context) => AllShopsBloc(),
        ),
        BlocProvider<ProductsByCategoryBloc>(
          create: (BuildContext context) => ProductsByCategoryBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<UserProfileBloc>(
          create: (BuildContext context) => UserProfileBloc(),
        ),
        BlocProvider<PaymentCategoryBloc>(
          create: (BuildContext context) => PaymentCategoryBloc(),
        ),
        BlocProvider<PaymentByCategoryBloc>(
          create: (BuildContext context) => PaymentByCategoryBloc(),
        ),
        BlocProvider<OrderPaymentBloc>(
          create: (BuildContext context) => OrderPaymentBloc(),
        ),
        BlocProvider<GameCategoriesBloc>(
          create: (BuildContext context) => GameCategoriesBloc(),
        ),
        BlocProvider<SliderBloc>(
          create: (BuildContext context) => SliderBloc(),
        ),
        BlocProvider<ProductsByShopBloc>(
            create: (BuildContext context) => ProductsByShopBloc()
        ),
        BlocProvider<TiketBloc>(
          create: (BuildContext context) => TiketBloc(),
        ),
        BlocProvider<PhoneAuthBloc>(
          create: (BuildContext context) => PhoneAuthBloc(),
        ),
        BlocProvider<UserOrdersBloc>(
          create: (BuildContext context) => UserOrdersBloc(),
        ),
      ],
      child: MaterialApp
        (
        debugShowCheckedModeBanner: false,
        title: 'M7Card',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home:LandingPage(),
        //firstPage(),
      ),
    );
  }
}


class LandingPage extends StatefulWidget {
  static bool isCheck = false;
  static UserProfile userProfile = UserProfile(id: 0,firstName: '',image: '', lastName: '', email: '', phone: '', gender: '', dateOfBirth: '', facebook: '', twitter: '', linkedin: '', instagram: '', pinterest: '', youtube: '');
  static String? token;
  const LandingPage({Key? key}) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

    bool? _checkIsLogin;
    String? _token;

    late UserProfile userProfile ;
    late UserProfileBloc _userProfileBloc;


    Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    _checkIsLogin = sharedPreferences.getBool("isLogin");
    if(_checkIsLogin == null || _checkIsLogin == false)
    {
      await sharedPreferences.setBool("isLogin",false);
      if(LandingPage.isCheck == false)
      {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              firstPage()
          ), (Route<dynamic> route) => false);
        });
      }
    }
    else
    {
        LandingPage.isCheck = _checkIsLogin!;
        if(LandingPage.isCheck == true)
        {
          _getToken().then((value) {
            _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
            _userProfileBloc.add(UserProfileButtonPressEvent(token: value!));
            LandingPage.token =value;
          });
        }
    }
    setState(() {
      print(LandingPage.isCheck);
    });
  }

    Widget firstPage()
    {
    if(_checkIsLogin == null || _checkIsLogin == false)
    {
      return const SigninEmailOrPhonePage();
    }
    return const BottomNavBar();
  }

    Future<String?> _getToken() async
    {
    var sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token')!;
    return _token;
  }

    pushToFirstScreen()  {

    readySharedPreferences();
  }



  @override
  void initState()
  {
    Future.delayed(Duration(seconds: 6),pushToFirstScreen);
    super.initState();
  }

/*
BlocListener<UserProfileBloc,UserProfileState>(
          listener: (BuildContext context, state)
          {
            if(state is GetUserProfileWaiting)
            {
              print("GetUserProfileWaiting");
            }
            if(state is GetUserProfileError)
            {
              print("GetUserProfileError");
            }
            if(state is GetUserProfileSuccess)
            {
              print("state.userProfile.firstName");
              print(state.userProfile.firstName);
              LandingPage.userProfile.firstName = state.userProfile.firstName;
              LandingPage.userProfile.lastName = state.userProfile.lastName;
              LandingPage.userProfile.image = state.userProfile.image;
              LandingPage.userProfile.id = state.userProfile.id;
              LandingPage.userProfile.phone = state.userProfile.phone;
              LandingPage.userProfile.gender = state.userProfile.gender;

              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    firstPage()
                ),
                        (Route<dynamic> route) => false);
              });
            }
          }
      );
 */

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<UserProfileBloc,UserProfileState>(
      listener:(BuildContext context,state)
      {
          if(state is GetUserProfileWaiting)
          {
            print("GetUserProfileWaiting");
          }
          if(state is GetUserProfileError)
          {
            print("GetUserProfileError");
          }
          if(state is GetUserProfileSuccess)
          {
            LandingPage.userProfile = state.userProfile;

            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  firstPage()
              ),
                      (Route<dynamic> route) => false);
            });
          }
      },
      child: Scaffold(
        body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: height/2.15),
              height: height,
              width:width,
              color: Colors.white,
              child: Image.asset(
                  fit: BoxFit.scaleDown,
                  height: height,
                  width:width,
                  'assets/images/landing_page.gif'
              ),
            )
        ),
      ),
    );
  }
}




/*
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {

  /*
  static bool? _checkIsLogin;

  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    _checkIsLogin = sharedPreferences.getBool("isLogin");
    if(_checkIsLogin == null || _checkIsLogin == false)
    {
      await sharedPreferences.setBool("isLogin",false);
    }
    setState(() {
      print(_checkIsLogin);
    });
  }

  Widget firstPage()
  {
    if(_checkIsLogin == null || _checkIsLogin == false)
    {
      return const SigninEmailOrPhonePage();
    }
    return const BottomNavBar();
  }

 */

  @override
  void initState() {
    //readySharedPreferences();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return firstPage();
  }
}
 */



// todo create routing service

