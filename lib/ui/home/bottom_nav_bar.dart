import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/ui/home/orders_list_page.dart';
import 'package:m7card/ui/home/quick_buy_page.dart';
import 'package:m7card/ui/home/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'economize_page.dart';
import 'home.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final Color _activeColor = const Color.fromRGBO(99, 91, 255, 1);
  int currentIndex = 4;

  @override
  void initState() {
    super.initState();
  }


  final screens = [
    const EconomizePage(),
    const OrdersListPage(),
    const QuickBuy(),
    const SearchPage(),
    const Home(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize : 24,
        selectedLabelStyle:const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 10,fontWeight: FontWeight.bold,),
        unselectedLabelStyle :const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 10,fontWeight: FontWeight.bold),
        type:BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: _activeColor,


        onTap: (index) => setState(() {
          currentIndex = index;
        }),

        items: [
          BottomNavigationBarItem(icon:const Icon(CupertinoIcons.profile_circled),label: "الملف الشخصي",backgroundColor: _activeColor,),
          BottomNavigationBarItem(icon:const Icon(FontAwesomeIcons.tag),label: "طلباتي",backgroundColor: _activeColor),
          BottomNavigationBarItem(icon:const Icon(Icons.bolt,color: Colors.amber,),label: "الشراء السريع",backgroundColor: _activeColor),
          BottomNavigationBarItem(icon:const Icon(Icons.search),label: "البحث",backgroundColor: _activeColor),
          BottomNavigationBarItem(icon:const Icon(Icons.home),label: "الرئيسية",backgroundColor: _activeColor),
        ],

      ),
      body: screens[currentIndex],
    );
  }
}

/*
PersistentTabView(
        context,
        controller: _bottomNavBarController,
        screens: _buildScreens(),
        items: _navBarsItems(),

        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
      ),
 */