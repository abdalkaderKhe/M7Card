import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/user.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/ui/account/direct_technical_support_chat.dart';
import 'package:m7card/ui/authentication/signin/signin_email_or_phone_page.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../account/add_coupon_code.dart';
import '../account/edit_account_Information_page.dart';
import '../account/settings_page.dart';
import '../account/technical_support_tickets.dart';
class EconomizePage extends StatefulWidget {
  const EconomizePage({Key? key}) : super(key: key);
  @override
  State<EconomizePage> createState() => _EconomizePageState();
}

class _EconomizePageState extends State<EconomizePage> {
  final  Color _buttonColor = const Color.fromRGBO(155, 149, 239, 1);

  late UserProfile userProfile ;
  late UserProfileBloc _userProfileBloc;

  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _isLogin = false;
  late String _token;

  Future<void> _checkIsLogin() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin;
    isLogin = sharedPreferences.getBool("isLogin")!;

    print("isLogin");

    setState(() {
      _isLogin = isLogin;
      print(_isLogin);
    });

    if(_isLogin == true)
    {
          _getToken().whenComplete((){
          _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
          _userProfileBloc.add(UserProfileButtonPressEvent(token: _token));
        });
    }
    else
      {
        _withOutLoginProfileBottomSheetMenu(context);
      }
  }

  Future<void> logOut()async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogin", false);
  }

  Future<String?> _getToken() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token')!;
    print("=======_token======");
    print(_token);
    return _token;
  }

  @override
  void initState() {
    _checkIsLogin();
    super.initState();
  }

  void showModelSheet()
  {
    _isLogin ? BlocBuilder<UserProfileBloc,UserProfileState>(
      builder: (BuildContext context,state){
        if(state is GetUserProfileWaiting){
          return const Center(child: CircularProgressIndicator(color: Colors.grey,),);
        }
        if(state is GetUserProfileError){
          return const SizedBox(
              child:  Center(
                  child: Text(ERROR_OCCURED, style: TextStyle(
                    fontSize: 14,
                    color: BLACK_GREY,
                  ))
              )
          );
        }
        if(state is GetUserProfileSuccess){
           print("=========GetUserProfileSuccess==========");

          _profileBottomSheetMenu(context, userProfile: state.userProfile,);
        }
        return const SizedBox();
      },
    ) : _withOutLoginProfileBottomSheetMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc,UserProfileState>(
      listener: (BuildContext context, state) {
        if(state is GetUserProfileWaiting)
        {
          print("GetUserProfileWaiting");
        }
        if(state is GetUserProfileError)
        {
           print("GetUserProfileError");
          _withOutLoginProfileBottomSheetMenu(context);
        }
        if(state is GetUserProfileSuccess)
        {
             print("GetUserProfileSuccess");
            _isLogin ?
            _profileBottomSheetMenu(context, userProfile: state.userProfile)
          : _withOutLoginProfileBottomSheetMenu(context);
        }
      },
      child: Container(
        color: const Color.fromRGBO(82, 81, 112, 1),
      ),
    );
  }

  /*
  _isLogin ? BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (BuildContext context,state){
            if(state is GetUserProfileWaiting){
              return const Center(child: CircularProgressIndicator(color: Colors.grey,),);
            }
            if(state is GetUserProfileError){
              return const SizedBox(
                  child:  Center(
                      child: Text(ERROR_OCCURED, style: TextStyle(
                        fontSize: 14,
                        color: BLACK_GREY,
                      ))
                  )
              );
            }
            if(state is GetUserProfileSuccess){
            return const SizedBox();
          },
        ) : _withOutLoginProfileBottomSheetMenu(context),
   */

  Widget _cardItem(BuildContext context)
  {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(height: 15,),
            const Text("سيارة",style: TextStyle(fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
            const SizedBox(height: 15,),
            const Text("% خصم يصل الى 25",style: TextStyle(fontFamily: "Almarai",
                color: Color.fromRGBO(143, 142, 148, 1),fontSize: 14),),

            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:const StadiumBorder(),
                primary:  _buttonColor,
              ),
              onPressed: (){
                _discountBottomSheetMenu(context);
              },
              child:const Padding(
                padding:  EdgeInsets.all(14.0),
                child:  Text("عرض الخصم",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _discountBottomSheetMenu(BuildContext context)
  {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          barrierColor: Colors.black54,
          context: context,
          isScrollControlled: true,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (builder) {
            return GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: const Color.fromRGBO(246, 246, 246, 1),
                padding:const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      const SizedBox(height: 5,),
                      Container(
                        height: 100,width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),


                      const SizedBox(height: 15,),
                      //نون
                      const Text("نون - Noon",style: TextStyle(fontFamily: "Almarai",
                          color: Color.fromRGBO(73, 70, 97, 1),fontSize: 18),),
                      const SizedBox(height: 7,),

                      const Text(
                        textAlign: TextAlign.center,
                        "تسوق منتجاتك المفضلة من أزياء والكترونيات ومنتجات المنزل والجمال ومنتجات الاطفال اونلاين",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(143, 142, 148, 1),
                            fontSize: 15),
                      ),
                      const SizedBox(height: 15,),

                      Container(height: 1,width: double.infinity,color: Colors.grey,),

                      const SizedBox(height: 30,),
                      const Text(
                        textAlign: TextAlign.center,
                        "العرض",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 17),
                      ),


                      const SizedBox(height: 10,),
                      const Text(
                        textAlign: TextAlign.center,
                        "%10 خصم",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(143, 142, 148, 1),
                            fontSize: 16),
                      ),


                      const SizedBox(height: 20,),
                      const Text(
                        textAlign: TextAlign.center,
                        "التفاصيل",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 17),
                      ),


                      const SizedBox(height: 10,),
                      const Text(
                        textAlign: TextAlign.center,
                        "يشمل جميع منتجات نون",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(143, 142, 148, 1),
                            fontSize: 16),
                      ),


                      const SizedBox(height: 20,),
                      const Text(
                        textAlign: TextAlign.center,
                        "آخر استخدام : منذ ساعتين",
                        style: TextStyle(
                            wordSpacing: 2,
                            height: 1.7,
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 16),
                      ),


                      const SizedBox(height: 25,),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 70,height: 55,
                            decoration:const BoxDecoration(
                                color:  Color.fromRGBO(155, 149, 239, 1),
                                borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(10.0),
                                     bottomLeft: Radius.circular(10.0),
                                ),
                            ),
                            child: const Text("نسخ",style: TextStyle(
                              fontFamily: "Almarai",
                              color: Colors.white,
                              fontSize: 17,
                            ),),

                          ),
                          DottedBorder(
                              color:const Color.fromRGBO(155, 149, 239, 1),
                              strokeWidth: 1,
                             // dashPattern : const  [7, 7],
                              padding : EdgeInsets.all(10),
                              child: Container(
                                padding:const EdgeInsets.all(8),
                                decoration:const BoxDecoration(
                                  color:  Color.fromRGBO(229, 232, 239, 1),
                                  /*
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                   */
                                ),
                                alignment: Alignment.centerRight,
                                width: 250,height: 50,
                                child: const Text("JA94",style: TextStyle(
                                  fontFamily: "Almarai",
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),),
                              )
                          ),
                        ],
                      ),

                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 45,width: 70,
                                decoration:const BoxDecoration(
                                  color:  Color.fromRGBO(229, 232, 239, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: IconButton(
                                  onPressed: () {  },
                                  icon:const Icon(Icons.thumb_down,size: 30,color: Color.fromRGBO(73, 70, 97, 1),),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                textAlign: TextAlign.center,
                                "غير فعال",
                                style: TextStyle(
                                    wordSpacing: 2,
                                    height: 1.7,
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                            alignment: Alignment.center,
                            height: 45,width: 70,
                            decoration:const BoxDecoration(
                              color:  Color.fromRGBO(229, 232, 239, 1),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: IconButton(
                              onPressed: () {  },
                              icon:const Icon(Icons.thumb_up,size: 30,color: Color.fromRGBO(73, 70, 97, 1),),
                            ),
                          ),
                              const SizedBox(height: 5,),
                              const Text(
                                textAlign: TextAlign.center,
                                "فعال",
                                style: TextStyle(
                                    wordSpacing: 2,
                                    height: 1.7,
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 45,width: 70,
                                decoration:const BoxDecoration(
                                  color:  Color.fromRGBO(229, 232, 239, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: IconButton(
                                  onPressed: () {  },
                                  icon:const Icon(Icons.favorite_rounded,size: 30,color: Color.fromRGBO(73, 70, 97, 1),),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                textAlign: TextAlign.center,
                                "أضف للمفضلة",
                                style: TextStyle(
                                    wordSpacing: 2,
                                    height: 1.7,
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 45,width: 70,
                                decoration:const BoxDecoration(
                                  color:  Color.fromRGBO(229, 232, 239, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: IconButton(
                                  onPressed: () {  },
                                  icon:const Icon(Icons.link,size: 30,color: Color.fromRGBO(73, 70, 97, 1),),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                textAlign: TextAlign.center,
                                "رابط المتجر",
                                style: TextStyle(
                                    wordSpacing: 2,
                                    height: 1.7,
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      )


                    ],
                  ),
                )
              ),
            );
           },
          );
    });
  }

  void _profileBottomSheetMenu(BuildContext context,{required UserProfile userProfile})
  {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          barrierColor: const Color.fromRGBO(82, 81, 112, 1),
          context: context,
          isScrollControlled: true,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (builder) {
            return GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: const Color.fromRGBO(246, 246, 246, 1),
                padding:const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Column(

                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:NetworkImage(userProfile.image),
                            radius: 25.0,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            " أهلا  ${userProfile.firstName} ${userProfile.lastName} ",
                            style: const TextStyle(
                                fontFamily: "Almarai",
                                color: Color.fromRGBO(73, 70, 97, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15,),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          const Icon(Icons.wallet,color: Colors.grey,size: 20,),
                          const SizedBox(width: 5,),
                          const Text(
                            "المحفظة",
                            style: TextStyle(
                                fontFamily: "Almarai",
                                color: Color.fromRGBO(73, 70, 97, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(width: 5,),
                          Container(
                            alignment: Alignment.center,
                            decoration:const BoxDecoration(
                              color: Color.fromRGBO(229, 232, 239, 1),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30),
                              ),
                            ),
                            height: 30,width: 70,
                            child: const Text(
                              "\$0.0",
                              style: TextStyle(
                                  fontFamily: "Almarai",
                                  color: Color.fromRGBO(134, 128, 224, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            //color: Color.fromRGBO(229, 232, 239, 1),
                          ),
                          const SizedBox(width: 10,),
                          Container(height: 25,color: Colors.grey,width: 1,),
                          const SizedBox(width: 10,),
                          const Icon(Icons.star,color: Colors.grey,size: 20,),
                          const SizedBox(width: 5,),
                          const Text(
                            "دليل M7 Card",
                            style: TextStyle(
                                fontFamily: "Almarai",
                                color: Color.fromRGBO(73, 70, 97, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(width: 5,),
                          Container(
                              alignment: Alignment.center,
                              decoration:const BoxDecoration(
                                color: Color.fromRGBO(229, 232, 239, 1),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30),
                                ),
                              ),
                              height: 30,width: 70,
                              child: const Text(
                                "0",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(134, 128, 224, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            //color: Color.fromRGBO(229, 232, 239, 1),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                    const SizedBox(height: 10,),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Text(
                                  "الرتبة الحالية لحسابك",
                                  style: TextStyle(
                                      fontFamily: "Almarai",
                                      color: Color.fromRGBO(136, 139, 148, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "زيادة الرتبة تعني زيادة العائد لكل عملية",
                                  style: TextStyle(
                                      fontFamily: "Almarai",
                                      color: Color.fromRGBO(177, 176, 182, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration:const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                              height: 40,
                              width: 40,
                              child:const Text("1",style: TextStyle(fontSize: 12,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                    const SizedBox(height: 15,),
                    Column(
                      children:[

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>  EditAccountInformationPage(userProfile: userProfile,),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      "حسابي",
                                      style: TextStyle(fontFamily: "Almarai", color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    SizedBox(width: 10,),

                                    InkWell(
                                      child: Icon(Icons.person,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                    )


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                  children:const [
                                    Text(
                                      "الاعدادات",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.settings,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddCouponCode(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),
                                Row(
                                  children:const [
                                    Text(
                                      "أضف رمز القسيمة الشرائية",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.password,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  TechnicalSupportTickets(token: _token, userProfile: userProfile,),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),
                                Row(
                                  children:const [
                                    Text(
                                      "تذاكر الدعم الفني",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.flag,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DirectTechnicalSupportChat(),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                  children:const [
                                    Text(
                                      "خدمة العملاء المباشرة",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.message,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),
                              Row(
                                children:const [
                                  Text(
                                    "نظام الاحالة",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(73, 70, 97, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.link,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                children:const [
                                  Text(
                                    "دليل",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(73, 70, 97, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.star,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Row(
                                children: const [
                                  Text(
                                    "شارك التطبيق",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.share,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "قييم التطبيق",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.star_half,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "حول",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.question_mark_rounded,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    child:const Text(
                                      "تسجيل الخروج",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(136, 139, 148, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    onTap: ()async{
                                      logOut();
                                      setState(() {});
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const SigninEmailOrPhonePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 15,),
                                  const Icon(Icons.logout,size: 25,color: Color.fromRGBO(136, 139, 148, 1),),
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }

  void _withOutLoginProfileBottomSheetMenu(BuildContext context)
  {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          barrierColor: const Color.fromRGBO(82, 81, 112, 1),
          context: context,
          isScrollControlled: true,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (builder) {
            return GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                color: const Color.fromRGBO(246, 246, 246, 1),
                padding:const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Column(
                  children: [
                    Column(
                      children:[
                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SigninEmailOrPhonePage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                  children:const [
                                    Text(
                                      "تسجيل الدخول",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.person,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                        const SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                  children:const [
                                    Text(
                                      "الاعدادات",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.settings,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                children:const [
                                  Text(
                                    "خدمة العملاء المباشرة",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(73, 70, 97, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.message,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),
                              Row(
                                children:const [
                                  Text(
                                    "نظام الاحالة",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(73, 70, 97, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.link,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              const Icon(Icons.arrow_back_ios,color: Color.fromRGBO(73, 70, 97, 1),size: 20,),                              Row(
                                children:const [
                                  Text(
                                    "M7Card دليل",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(73, 70, 97, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.star,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 15,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Row(
                                children: const [
                                  Text(
                                    "شارك التطبيق",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.share,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "قييم التطبيق",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.star_half,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "حول",
                                    style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(168, 165, 184, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.question_mark_rounded,size: 20,color: Color.fromRGBO(168, 165, 184, 1),),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 10,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }

}
/*
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color:const Color.fromRGBO(130, 113, 227, 1),
                          child: Container(
                            margin:const EdgeInsets.all(3),
                            padding:const EdgeInsets.all(11),
                            child: Row(
                              children:const [
                                Text(
                                  "الكل",
                                  style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              primary: false,
                              padding: const EdgeInsets.all(10),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children:const [
                                        Icon(
                                          Icons.airlines,
                                          size: 20,
                                          color: Color.fromRGBO(82, 82, 110, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "سياحة وسفر",
                                          style: TextStyle(
                                              fontFamily: "Almarai",
                                              color:
                                                  Color.fromRGBO(82, 82, 110, 1),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded (
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 6,
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: _cardItem(context),
                        );
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5,
                        mainAxisSpacing :  5,
                        mainAxisExtent: 270,
                      ),
                    ),
                  ),
                ),
              ],
            ),
 */