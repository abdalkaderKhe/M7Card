import 'package:flutter/material.dart';

class DirectTechnicalSupportChat extends StatefulWidget {
  const DirectTechnicalSupportChat({Key? key}) : super(key: key);
  @override
  State<DirectTechnicalSupportChat> createState() => _DirectTechnicalSupportChatState();
}

class _DirectTechnicalSupportChatState extends State<DirectTechnicalSupportChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading : false,
        centerTitle: true,
        title: const Text(
          "خدمة العملاء المباشرة",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 17,
              fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 30,),color: Color.fromRGBO(133, 116, 231, 1)),
        ],

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //"لديك اسئلة تواصل معنا"
            Container(
              color: const Color.fromRGBO(133, 116, 231, 1),
              height: 100,
              width: double.infinity,
              child: const Center(child: Text("لديك اسئلة تواصل معنا",style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900))),
            ),

            Container(
              child: Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                ),
              )
            ),

            Container(
              decoration: const BoxDecoration(
                 border: Border(
                      top: BorderSide(
                    color: Color.fromRGBO(133, 116, 231, 1),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: TextField(
                      onChanged: (value){

                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        hintText: "أكتب رسالتك هنا.....",
                        border: InputBorder.none,
                      ),

                    ),
                  ),

                  TextButton(onPressed: (){}, child: const Text("ارسال",style: TextStyle(color: Color.fromRGBO(133, 116, 231, 1),),)),


                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
  Widget messageWidget(){
   return Container();
  }
}
