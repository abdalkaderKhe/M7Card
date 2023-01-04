import 'package:flutter/material.dart';
import 'package:m7card/model/user_profile.dart';

import 'add_new_technical_support_ticket.dart';

class TechnicalSupportTickets extends StatefulWidget {
  String token;
  UserProfile userProfile;
  TechnicalSupportTickets({Key? key,required this.token , required this.userProfile}) : super(key: key);
  @override
  State<TechnicalSupportTickets> createState() => _TechnicalSupportTicketsState();
}

class _TechnicalSupportTicketsState extends State<TechnicalSupportTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),

      floatingActionButtonLocation : FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        width:190,height:55,child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:const StadiumBorder(),
          primary:const  Color.fromRGBO(155, 149, 239, 1),
        ),
        onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  AddNewTechnicalSupportTicket(token: widget.token, userProfile: widget.userProfile,),
              ),
            );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            Text("اضافة تذكرة جديدة",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 16,fontWeight: FontWeight.w900),),
            Icon(Icons.add,color: Colors.white,),
          ],
        ),
       ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              color: Color.fromRGBO(133, 116, 231, 1)),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 180),
          child: Text(
            "تذاكر الدعم الفني",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body:  Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 150,),
              SizedBox(width: 400,height: 220,child: Image.asset("assets/images/logo.png"),),
              const Text(
                "لايوجد تذاكر دعم فني",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color:  Color.fromRGBO(73, 70, 97, 1) ,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15,),
              const Text(
                textAlign : TextAlign.center,
                "لايوجد اي تذاكر دعم فني سابقة",
                style: TextStyle(
                  height: 1.5,
                  fontFamily: "Almarai",
                  color:  Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
