import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddCreditPaymentForm extends StatefulWidget {
  const AddCreditPaymentForm({Key? key}) : super(key: key);
  @override
  State<AddCreditPaymentForm> createState() => _AddCreditPaymentFormState();
}

class _AddCreditPaymentFormState extends State<AddCreditPaymentForm> {
  late final  TextEditingController _recipientEditingController = TextEditingController();
  late final  TextEditingController _passwordEditingController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        automaticallyImplyLeading:false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              color: Color.fromRGBO(133, 116, 231, 1)),
        ],

        title: const Padding(
          padding: EdgeInsets.only(left: 220),
          child: Text(
            "تحويل رصيد",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
             color: Colors.grey.shade200,
             height: 80,
             width: double.infinity,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 18,),child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "LBP" ,style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                    ),
                    SwitchButton(),
                    Text(
                      "USD" ,style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                    ),
                  ],
                ),),
                Padding(padding: EdgeInsets.symmetric(horizontal: 18),child:Row(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(bottom: 5),child: Text("رصيدي :", style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w900),),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "0.53 USD" ,style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w900),
                    ),
                  ],
                ),),
               ],
             ),
           ),
          Container(color: Colors.grey,width: double.infinity,height: 2,),
          SizedBox(height: 35,),
          SizedBox(
            height: 65,width: 330,
            child: TextFormField(
              controller: _recipientEditingController,
              textAlign:TextAlign.start ,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor:const Color.fromRGBO(229, 232, 239, 1),
                filled: true,
                hintText: "رقم هاتف المستلم",
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
          SizedBox(height: 10,),
          SizedBox(
            height: 65,width: 330,
            child: TextFormField(
              controller: _recipientEditingController,
              textAlign:TextAlign.start ,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor:const Color.fromRGBO(229, 232, 239, 1),
                filled: true,
                hintText: "المبلغ المراد تحويله",
                hintTextDirection: TextDirection.rtl,
                suffixIcon: Icon(Icons.monetization_on),
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
          SizedBox(height: 10,),
          SizedBox(
            height: 65,width: 330,
            child: TextFormField(
              controller: _recipientEditingController,
              textAlign:TextAlign.start ,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor:const Color.fromRGBO(229, 232, 239, 1),
                filled: true,
                hintText: "ملاحظة",
                hintTextDirection: TextDirection.rtl,
                suffixIcon: Icon(Icons.note_alt_rounded),
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
          SizedBox(height: 10,),
          SizedBox(
            height: 65,width: 330,
            child: TextFormField(
              controller: _recipientEditingController,
              textAlign:TextAlign.start ,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor:const Color.fromRGBO(229, 232, 239, 1),
                filled: true,
                hintText: "المبلغ المستلم",
                hintTextDirection: TextDirection.rtl,
                suffixIcon: Icon(Icons.attach_money),
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
          SizedBox(height: 20,),
          Text(
            "الغاء هذه العملية يتطلب موافقة المستفيد",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(133, 116, 231, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 30,),
          SizedBox(
            height: 50,
            width: 100,
            child: OutlinedButton(
              child: Text('ارسال',style:TextStyle(
                  fontFamily: "Almarai",
                  //color: Color.fromRGBO(133, 116, 231, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w200),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromRGBO(133, 116, 231, 1),
                primary: Colors.white,
              ), onPressed: () {  },
            ),
          ),
        ],
      ),
    );
  }

}

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});
  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.blueAccent;
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.blueAccent;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    return Switch(
      // This bool value toggles the switch.
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(133, 116, 231, 1)),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
