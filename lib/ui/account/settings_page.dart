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
              color: Color.fromRGBO(133, 116, 231, 1)),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 240),
          child: Text(
            "الاعدادات",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             const  SizedBox(height: 15,),
             Text(
              "اعدادات التنبيهات",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ), //
            // "اعدادات التنبيهات",
             const SizedBox(height: 12,),
             Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),

            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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

            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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

            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 SizedBox(
                  // height: 50,
                   width: 300,
                   child: Text(
                     textAlign : TextAlign.end,
                     overflow: TextOverflow.ellipsis,
                     maxLines : 2,
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

            const SizedBox(height: 12,),
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
            const  SizedBox(height: 18,),
            Text(
              "لغة التطبيق",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12,),
            Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),
            const SizedBox(height: 12,),
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
            const SizedBox(height: 12,),
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
            const  SizedBox(height: 18,),
            Text(
              "المظهر",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12,),
            Container(height: 1, width: double.infinity,color: Colors.grey.shade400,),
            const SizedBox(height: 12,),
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

            const SizedBox(height: 45,),
            SizedBox(
              width: double.infinity,
              height: 55,
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

          ],
        ),
      ),
    );
  }
}
