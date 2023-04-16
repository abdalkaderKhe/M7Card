import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/main.dart';
import 'package:m7card/model/user.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/ui/account/direct_technical_support_chat.dart';
import 'package:m7card/ui/authentication/signin/signin_email_or_phone_page.dart';
import 'package:m7card/ui/home/home.dart';
import 'package:m7card/ui/home/web_view_page.dart';
import 'package:m7card/ui/shopping_cart/payment_page.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../account/add_coupon_code.dart';
import '../account/edit_account_Information_page.dart';
import '../account/settings_page.dart';
import '../account/technical_support_tickets.dart';
import 'bottom_nav_bar.dart';
class EconomizePage extends StatefulWidget {
  const EconomizePage({Key? key}) : super(key: key);
  @override
  State<EconomizePage> createState() => _EconomizePageState();
}

class _EconomizePageState extends State<EconomizePage> {

  Future<void> logOut()async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogin", false);
    LandingPage.isCheck = false;
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  init()
  {
    LandingPage.isCheck && LandingPage.isCheck != null
        ?
    _profileBottomSheetMenu(context, userProfile: LandingPage.userProfile)
        :
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => SigninEmailOrPhonePage()), (Route route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(82, 81, 112, 1),
    );
  }


  void _profileBottomSheetMenu(BuildContext context,{required UserProfile userProfile})
  {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          enableDrag: true,
          isDismissible: true,
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
                height: MediaQuery.of(context).size.height * 0.90,
                color: const Color.fromRGBO(246, 246, 246, 1),
                padding:const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(width: 10,),
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
                              "\$1860",
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

                    Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WebViewPage(url: 'https://m7card.manarhays.com/api/v100//level/4',),
                          ),
                        );
                      },
                      child:  Directionality(
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
                    ),


                    Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

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
                                builder: (context) => const PaymentCategoryPage(),
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
                                      "اضافة رصيد",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.monetization_on,size: 25,color: Color.fromRGBO(73, 70, 97, 1),),
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
                                builder: (context) =>  TechnicalSupportTickets(token: LandingPage.token!, userProfile: userProfile,),
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
                             GestureDetector(
                               onTap: ()
                               {

                               },
                               child:
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
                             ),),
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

                            GestureDetector(
                              onTap: ()
                              async {
                                print(" Share.share('com.M7Card.m7card')");
                                await Share.share('com.M7Card.m7card');
                              },
                              child:Row(
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
                              GestureDetector
                                (
                                onTap: ()
                                {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => WebViewPage(url: 'https://m7card.manarhays.com/api/v100/about',),
                                    ),
                                  );
                                },
                                child: Row(
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
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 20,),

                        Container(height: 1,color: Colors.grey.shade300,width: double.infinity,),

                        const SizedBox(height: 5,),

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
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) => SigninEmailOrPhonePage()), (Route route) => false);
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
          },
        ).then((value){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) => BottomNavBar()), (Route route) => false);
      });
      },
    );

  }



}

