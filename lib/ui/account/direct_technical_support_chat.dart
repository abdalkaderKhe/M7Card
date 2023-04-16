import 'package:flutter/material.dart';
class DirectTechnicalSupportChat extends StatefulWidget {
  const DirectTechnicalSupportChat({Key? key}) : super(key: key);
  @override
  State<DirectTechnicalSupportChat> createState() => _DirectTechnicalSupportChatState();
}

class _DirectTechnicalSupportChatState extends State<DirectTechnicalSupportChat> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
              fontSize: 15,
              fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_forward,size: 22,),color: Color.fromRGBO(133, 116, 231, 1)),
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
              height: height / 8,
              width: double.infinity,
              child: const Center(child: Text("لديك اسئلة تواصل معنا",style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700))),
            ),

            Container(
              child: Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: width / 50,vertical: height / 20),
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
                      onChanged: (value)
                      {

                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        hintText: "أكتب رسالتك هنا.....",
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),

                    ),
                  ),

                  TextButton(onPressed: (){},
                      child: const Text("ارسال",style: TextStyle(color: Color.fromRGBO(133, 116, 231, 1),fontSize: 14),),
                  ),


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
