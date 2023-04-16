import 'package:flutter/material.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;

   Color _activeColor = const Color.fromRGBO(73, 70, 97, 1);

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
              onPressed: () { Navigator.pop(context);},
              icon: const Icon(
                Icons.arrow_forward,
                size: 25,
              ),
              color: Color.fromRGBO(133, 116, 231, 1)),
        ],
        title: Text(
          "الاعدادات",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 14,
              fontWeight: FontWeight.w800),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/ 50,),
             Text(
              "اعدادات التنبيهات",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ), //
            // "اعدادات التنبيهات",
            SizedBox(height: height/ 50,),
            Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),

            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  "ارسال كود البطاقة الى البريد الالكتروني",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked1 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                  ),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "الرسائل الشهرية لمعرفة جديدنا من التحديثات والعروض",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked2 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(
                  // height: 50,
                   width: 300,
                   child: Text(
                     textAlign : TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                     maxLines : 3,
                    "المناسبات والاعياد (قد تتضمن خصومات حصرية الى مستلميها)",
                    style: TextStyle(
                        fontFamily: "Almarai",
                        color: isChecked3 ? _activeColor : Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                ),
                 ),
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked3 = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                  "الايميل الذكي لمعرفة مايهمك وما قد تحتاجه",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked4 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked4,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked4 = value!;
                    });
                  },
                ),
              ],
            ),

            ///////////////////////////////
            SizedBox(height: height /90,),
            Text(
              "لغة التطبيق",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height /70,),
            Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),
            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "اللغة العربية",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked5 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                Checkbox(
                  shape: CircleBorder(),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked5,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked5 = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "اللغة الانكليزية",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked6 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                Checkbox(
                  shape: CircleBorder(),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked6,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked6 = value!;
                    });
                  },
                ),
              ],
            ),

            ///////////////////
            SizedBox(height: height /90,),
            Text(
              "المظهر",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height /90,),
            Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),
            SizedBox(height: height /90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  side:const BorderSide(width: 4,color: Colors.grey),
                  activeColor : Colors.green,
                  checkColor: Colors.white,
                  value: isChecked7,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked7 = value!;
                    });
                  },
                ),
                Text(
                  "التفعيل التلقائي للوضع الداكن",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: isChecked6 ? _activeColor : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),

            SizedBox(height: height /70,),
            SizedBox(
              width: double.infinity,
              height: height /15,
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
                    Text("حفظ التغييرات",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,
                        fontWeight: FontWeight.w800),)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
