import 'package:shared_preferences/shared_preferences.dart';
class UserProfileServices{

  Future<void> logOut()async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogin", false);
  }

  Future<String> getToken(String token) async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token')!;
    return token;
  }

  Future<bool> checkIsLogin(bool isLogin) async
  {
    var sharedPreferences = await SharedPreferences.getInstance();

    bool checkIsLogin;

    checkIsLogin = sharedPreferences.getBool("isLogin")!;

    isLogin = checkIsLogin;

    return isLogin;
  }

}