import 'package:flutter/material.dart';
import 'package:m7card/ui/home/order_page.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
class OrdersListPage extends StatelessWidget {
  const OrdersListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor :Colors.transparent,
      extendBodyBehindAppBar: false,
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:const Text("طلباتي",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.grid_view_rounded,
                  size: 30,
                  color: Color.fromRGBO(133, 116, 231, 1),
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip:
                MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [

          _buildSearchField(context),

          const SizedBox(height: 10,),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),

          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                }
                ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: size.height * 0.09,
                    width: size.width * 1,
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("05:49 2022-11-12",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          const Text("SoluChil 50 Diamonl",style: TextStyle(fontSize: 14,fontFamily: "Almarai",),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("7631#",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                              Text("12138822",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.indigo),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.amberAccent,),
                  ),
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
  Widget _buildSearchField(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: TextFormField(
        textAlign:TextAlign.start,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor:const Color.fromRGBO(229, 232, 239, 1),
          filled: true,
          hintText: "ابحث",
          hintStyle: const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(181, 180, 240, 1),fontSize: 14,),
          hintTextDirection: TextDirection.rtl,
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
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
    );
  }

}
