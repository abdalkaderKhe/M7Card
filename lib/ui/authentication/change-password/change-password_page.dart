import 'package:flutter/material.dart';
import 'package:m7card/ui/home/bottom_nav_bar.dart';

import '../../widgets/backgroud_color.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _keyForm = GlobalKey<FormState>();

  late final  TextEditingController _currentPasswordController = TextEditingController();
  late final  TextEditingController _newPasswordController =  TextEditingController();
  late final  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading : false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title:  Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(),
                ),
              );
            },
            child:const Center(child: Text("تصفح بدون تسجيل",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(83, 81, 94, 1),fontSize: 14,fontWeight: FontWeight.bold),)
            ),
          ),
        ),
        actions: [
          const Center(child: Text("استعادة كلمة المرور",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),)),
          IconButton(onPressed: () {
             Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
        ],
      ),
      body: Stack(
        children: [
          const BackGroundColor(),

        ],
      ),
    );
  }
}
