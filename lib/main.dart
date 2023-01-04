import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/bloc/auth/login/login_bloc.dart';
import 'package:m7card/bloc/auth/register_bloc.dart';
import 'package:m7card/bloc/category/products_by_category/products_by_category_bloc.dart';
import 'package:m7card/bloc/drawer/game_categories/game_categories_bloc.dart';
import 'package:m7card/bloc/home/slider/slider_bloc.dart';
import 'package:m7card/bloc/payment/order_payment/order_payment_bloc.dart';
import 'package:m7card/bloc/payment/payment_by_category/payment_by_category_bloc.dart';
import 'package:m7card/bloc/payment/payment_category/payment_category_bloc.dart';
import 'package:m7card/bloc/shop/all_shops/all_shops_bloc.dart';
import 'package:m7card/model/payment_category.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  Future<void> _isLogin({required bool isLogin}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('isLogin', isLogin);
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool? _checkIsLogin;

  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
     //sharedPreferences.setBool("isLogin",false);
     //sharedPreferences.setString("token","token");
    _checkIsLogin = sharedPreferences.getBool("isLogin");
    setState(() {
      print(_checkIsLogin);
    });
  }

  Widget firstPage(){
    if(_checkIsLogin == null || _checkIsLogin == false){
     return const SigninEmailOrPhonePage();
    }
    return const BottomNavBar();
  }

  @override
  void initState() {
    readySharedPreferences();
    super.initState();
  }

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
        BlocProvider<TiketBloc>(
          create: (BuildContext context) => TiketBloc(),
        ),
      ],
      child: MaterialApp
        (
        debugShowCheckedModeBanner: false,
        title: 'M7Card',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: firstPage(),
      ),
    );
  }
}
