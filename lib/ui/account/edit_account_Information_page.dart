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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              color: const Color.fromRGBO(133, 116, 231, 1),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 260),
          child: Text(
            "حسابي",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding:const EdgeInsets.all(20),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 15,),
              const Text(
                "معلومات الحساب",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(136, 139, 148, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15,),
              Container(height: 1,color: Colors.grey.shade400,width: double.infinity,),

               // image
              /*
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "الصورة الشخصية",
                        style: TextStyle(
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 10,),
                       Text(
                        "انقر على الصورة لاضافتها او تحديثها",
                        style: TextStyle(
                            fontFamily: "Almarai",
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 13,),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(229, 232, 239, 1),
                    radius: 40,
                    child: Image.network(widget.userProfile.image),
                    //Icon(Icons.person,size: 32),
                  ),
                ],
              ),
 */




              const SizedBox(height: 30,),

              Text(
                "رقم الهاتف",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                height: 55,width: 330,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    //hintText: "البريد الالكتروني أو رقم الهاتف",
                    hintTextDirection: TextDirection.rtl,
                   /*
                    prefixIcon: SizedBox(
                        width: 80,
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                            [
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: ()async{
                                 // final code = await countryPicker.showPicker(context: context);
                                 // if (code != null) {
                                 //   setState(() {
                                //      countryCode = code.dialCode;
                                //    });
                               //   }
                                },
                                child:Icon(Icons.keyboard_arrow_down_sharp),
                              ),
                              const SizedBox(width: 5,),
                              Text(countryCode),
                              const  Text("|",style: TextStyle(fontSize: 22),),
                            ],
                          ),
                        )
                    ),
                    */
                    suffixIcon:const Icon(Icons.send_to_mobile_outlined),
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









              const SizedBox(height: 25,),
              Text(
                "الاسم",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 55,width: 330,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "abdalakder",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon: Icon(Icons.person),
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

              const SizedBox(height: 25,),
              Text(
                "البريد الالكتروني",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 55,width: 330,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "abdalakder@gmail.com",
                    hintTextDirection: TextDirection.rtl,
                    suffixIcon: Icon(Icons.email),
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

              const SizedBox(height: 25,),
              Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: Center(
                 child: Row(
                   //crossAxisAlignment: CrossAxisAlignment.center,
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
                     SizedBox(width: 10,),
                     Icon(Icons.warning,size: 25,color: Colors.red,),
                   ],
                 ),
               ),
             ),
              const SizedBox(height: 25,),

              const Text(
                "تغيير كلمة المرور",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10,),
              Container(height: 1,color: Colors.grey.shade400,width: double.infinity,),

              const SizedBox(height: 25,),
              Text(
                "كملة المرور",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 55,width: 330,
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



              const SizedBox(height: 25,),
              Text(
                "كلمة المرور الجديدة",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 55,width: 330,
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



              const SizedBox(height: 25,),
              Text(
                "تأكيد كملة المرور الجديدة",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 55,width: 330,
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

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 220),
                child: Row(
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
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Icon(Icons.person_off,color: Colors.red,size: 25,),
                  ],
                ),
              ),

              const SizedBox(height: 50,),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:const StadiumBorder(),
                    primary:const  Color.fromRGBO(99, 91, 255, 1),
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Icon(Icons.save,color: Colors.white,),
                      Text("حفظ التغييرات",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
