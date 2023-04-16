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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    late final  TextEditingController _emailEditingController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading : false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          const Center(child: Text("استعادة كلمة المرور",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 15,fontWeight: FontWeight.w800),)),
          IconButton(onPressed: () {
             Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_forward,size: 24,),color: Color.fromRGBO(133, 116, 231, 1)),
        ],
      ),

      body: Stack(
        children: [
          const BackGroundColor(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 13,
                  width: width / 1.2,
                  child: TextFormField(
                    controller: _emailEditingController,
                    validator: (text){
                      if(text!.isNotEmpty){
                        if (text.length > 5 && text.contains('@') && text.endsWith('.com')) {
                          return null;
                        }
                      }
                    },
                    textAlign:TextAlign.start ,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      hintText: "البريد الالكتروني",
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
                  width: width / 1.2,
                  height: height / 18,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:const StadiumBorder(),
                      primary:const  Color.fromRGBO(155, 149, 239, 1),
                    ),
                    onPressed: (){
                      if (_keyForm.currentState!.validate()) {

                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                        Text("استعادة",style: TextStyle(fontFamily: "Almarai",
                            color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
