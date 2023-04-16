import 'package:flutter/material.dart';
class AddCouponCode extends StatefulWidget {
  const AddCouponCode({Key? key}) : super(key: key);
  @override
  State<AddCouponCode> createState() => _AddCouponCodeState();
}

class _AddCouponCodeState extends State<AddCouponCode> {
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
                  size: 25,
                ),
                color: Color.fromRGBO(133, 116, 231, 1)),
          ],
          title: Text(
            "أضف قسيمة شرائية",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ),


        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:width /15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SizedBox(width: width / 1.2,height: height / 4,child: Image.asset("assets/images/logo.png"),),
                 const Text(
                  "أضف القسيمة الشرائية",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color:  Color.fromRGBO(73, 70, 97, 1) ,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),

                SizedBox(height: height / 35,),
                const Text(
                   textAlign : TextAlign.center,
                  "تستطيع اضافة رصيد عبر قسيمة M7 Card . يرجى تأكد رجاء من صحة القسيمة وحالتها قبل الضغط على اضافة ",
                  style: TextStyle(
                      height: 1.5,
                      fontFamily: "Almarai",
                      color:  Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: height / 35,),
                SizedBox(
                  height: height / 18,
                  width: double.infinity,
                  child: TextFormField(
                    textAlign:TextAlign.start ,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      hintText: "رمز القسيمة",
                      hintStyle:const TextStyle(fontFamily: "Almarai",fontSize: 14),
                      hintTextDirection: TextDirection.rtl,
                      suffixIcon:const Icon(Icons.qr_code_2_rounded,size: 20,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height / 35,),
                SizedBox(
                  width: double.infinity,
                  height: height / 17,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:const StadiumBorder(),
                      primary:const  Color.fromRGBO(155, 149, 239, 1),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Icon(Icons.add,color: Colors.white,size: 20,),
                        Text("اضافة",style: TextStyle(fontFamily: "Almarai",
                            color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
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
