import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:m7card/model/user_profile.dart';

class EditAccountInformationPage extends StatefulWidget {
  UserProfile userProfile;
  EditAccountInformationPage({Key? key,required this.userProfile}) : super(key: key);
  @override
  State<EditAccountInformationPage> createState() => _EditAccountInformationPageState();
}

class _EditAccountInformationPageState extends State<EditAccountInformationPage> {

  final countryPicker = const FlCountryCodePicker();
  String countryCode = "+90";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 24,
              ),
              color: const Color.fromRGBO(133, 116, 231, 1),
          ),
        ],
        title:Text(
          "حسابي",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 15,
              fontWeight: FontWeight.w800),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal:width / 20),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "معلومات الحساب",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(136, 139, 148, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              Container(height: 1,color: Colors.grey.shade400,width: double.infinity,),

              SizedBox(height: height / 90,),

              Text(
                "رقم الهاتف",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),

              SizedBox(height: height / 70,),

              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon:const Icon(Icons.send_to_mobile_outlined,size: 22,),
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
              Text(
                "الاسم",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),


              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "abdalakder",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon: Icon(Icons.person,size: 22,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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
              Text(
                "البريد الالكتروني",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "abdalakder@gmail.com",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon: Icon(Icons.email,size: 22,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لتعديل الاسم او البريد الالكتروني يرجى تذكرة دعم فني",
                      style: TextStyle(
                          fontFamily: "Almarai",
                          color: Colors.grey.shade400,
                          fontSize: 13,
                          fontWeight: FontWeight.w800),
                    ),
                    //SizedBox(width: 10,),
                    Icon(Icons.warning,size: 23,color: Colors.red,),
                  ],
                ),
              ),
              SizedBox(height: height / 70,),

              const Text(
                "تغيير كلمة المرور",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              Container(height: 1,color: Colors.grey.shade400,width: double.infinity,),

              SizedBox(height: height / 70,),
              Text(
                "كملة المرور",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "اتركه فارغا اذا لم ترد التغيير",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon:const Icon(Icons.key,size: 22,),
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



              SizedBox(height: height / 70,),
              Text(
                "كلمة المرور الجديدة",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "اتركه فارغا اذا لم ترد التغيير",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon:const Icon(Icons.key,size: 22,),
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



              SizedBox(height: height / 70,),
              Text(
                "تأكيد كملة المرور الجديدة",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height / 70,),
              SizedBox(
                height: height / 18,
                width: width / 1,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "اتركه فارغا اذا لم ترد التغيير",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon:const Icon(Icons.key,size: 22,),
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

              SizedBox(height: height / 70,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "حذف الحساب",
                      style: TextStyle(
                          fontFamily: "Almarai",
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Icon(Icons.person_off,color: Colors.red,size: 22,),
                ],
              ),

              SizedBox(height: height / 70,),

              SizedBox(
                height: height / 16,
                width: width / 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:const StadiumBorder(),
                    primary:const  Color.fromRGBO(99, 91, 255, 1),
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Icon(Icons.save,color: Colors.white,size: 22,),
                      Text("حفظ التغييرات",style: TextStyle(fontFamily: "Almarai",color: Colors.white,
                          fontSize: 14,fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
