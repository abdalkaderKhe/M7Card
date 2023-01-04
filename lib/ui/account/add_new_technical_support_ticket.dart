import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/account/tiket/tiket/tiket_bloc.dart';
import 'package:m7card/model/user_profile.dart';
class AddNewTechnicalSupportTicket extends StatefulWidget {
  UserProfile userProfile;
  String token;
  AddNewTechnicalSupportTicket({Key? key,required this.token ,required this.userProfile }) : super(key: key);
  @override
  State<AddNewTechnicalSupportTicket> createState() => _AddNewTechnicalSupportTicketState();
}

class _AddNewTechnicalSupportTicketState extends State<AddNewTechnicalSupportTicket> {

  TiketBloc _tiketBloc = TiketBloc();
  late final TextEditingController _tiketTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TiketBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0.5,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              color: const Color.fromRGBO(133, 116, 231, 1)),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 170,right: 0),
          child: Text(
            "اضافة تذكرة جديدة",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),

      body: BlocListener<TiketBloc, TiketState>(
        listener:(BuildContext context, state) {
          if (state is PostTiketError)
          {
             print("PostTiketError");
          }
          if(state is PostTiketWaiting)
          {
            print("PostTiketWaiting");
          }
          if(state is PostTiketSuccess)
          {
            print("PostTiketSuccess");
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /*
                          const SizedBox(height: 20,),
              const  Text(
                textAlign : TextAlign.end,
                "هل جربت التأكد من عدم وجود اجابة لسؤالك في صفحة الاسئلة الشائعة",
                style: TextStyle(
                    height: 1.8,
                    fontFamily: "Almarai",
                    color:  Color.fromRGBO(73, 70, 97, 1) ,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              const  SizedBox(height: 10,),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText: "تصفح لاسئلة الشائعة",
                    hintStyle:const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(133, 116, 231, 1),fontSize: 15,fontWeight: FontWeight.w900),
                    hintTextDirection: TextDirection.rtl,
                    // suffixIcon:const Icon(Icons.message),
                    prefixIcon:const Icon(Icons.message,color:Color.fromRGBO(133, 116, 231, 1),size: 17,),
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
               */
              const SizedBox(height: 50,),
              const Text(
                textAlign : TextAlign.end,
                "عنوان التذكرة",
                style: TextStyle(
                    height: 1.8,
                    fontFamily: "Almarai",
                    color:  Color.fromRGBO(73, 70, 97, 1) ,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              const  SizedBox(height: 15,),

              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextFormField(
                  controller: _tiketTitleController,
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.all(14.0),
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText:  "عنوان التذكرة",
                    hintStyle: TextStyle(fontFamily: "Almarai",color: Colors.grey.shade500,fontSize: 15,fontWeight: FontWeight.w900),
                    hintTextDirection: TextDirection.rtl,
                    // suffixIcon:const Icon(Icons.message),
                   // prefixIcon:const Icon(Icons.message,color:Color.fromRGBO(133, 116, 231, 1),size: 17,),
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

              /*
              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14.0),
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText:  "نوع التذكرة",
                    hintStyle: TextStyle(fontFamily: "Almarai",color: Colors.grey.shade500,fontSize: 15,fontWeight: FontWeight.w900),
                    hintTextDirection: TextDirection.rtl,
                    // suffixIcon:const Icon(Icons.message),
                     prefixIcon:const Icon(Icons.keyboard_arrow_down_outlined,color:Colors.grey,size: 17,),
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
              */
              const  SizedBox(height: 20,),
              /*

              SizedBox(
                height: 170,
                width: double.infinity,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  maxLines: 6,
                 // minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),                  fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,

                    hintText:  "يرجى كتابة وصف المساعدى بشكل أدق",
                    hintStyle: TextStyle(fontFamily: "Almarai",color: Colors.grey.shade500,fontSize: 15,fontWeight: FontWeight.w500),
                    hintTextDirection: TextDirection.rtl,
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

              SizedBox(
                height: 70,
                width: double.infinity,
                child: TextFormField(
                  textAlign:TextAlign.start ,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    fillColor:const Color.fromRGBO(229, 232, 239, 1),
                    filled: true,
                    hintText:  "أضافة مرفقات",
                    hintStyle: TextStyle(fontFamily: "Almarai",color: Colors.grey.shade400,fontSize: 15,fontWeight: FontWeight.w900),
                    hintTextDirection: TextDirection.rtl,
                     suffixIcon: Icon(Icons.upload_file_rounded,color:Colors.grey.shade400 ,),
                    //prefixIcon:const Icon(Icons.keyboard_arrow_down_outlined,color:Colors.grey,size: 17,),
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
 */

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:const StadiumBorder(),
                    primary:const  Color.fromRGBO(155, 149, 239, 1),
                  ),
                  onPressed: (){
                    if(_tiketTitleController.text.isNotEmpty)
                    {
                      _tiketBloc.add(SubmitTiketButtonPressEvent(token: widget.token, userProfile: widget.userProfile));
                       Navigator.of(context).pop();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Icon(Icons.arrow_back,color: Colors.white,),
                      Text("اضافة تذكرة",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),)
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
