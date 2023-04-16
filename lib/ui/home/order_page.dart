import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  String price;
  String createdAt;
  String playerName;
  String quantity;
  OrderPage({Key? key , required this.price ,  required this.createdAt , required this.playerName , required this.quantity}) : super(key: key);
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:const Text("تفاصيل الطلب",
          style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.065,
              width: size.width * 1,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${widget.price}#",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.indigo),),
                    Text("معرفة الطلب",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black54),),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.065,
              width: size.width * 1,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:const [
                    Text("مكتمل",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.indigo),),
                    Text("حالة الطلب",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black54),),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.065,
              width: size.width * 1,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${widget.playerName}",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.indigo,fontWeight: FontWeight.w100),),
                    Text("المنتج",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black54),),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.065,
              width: size.width * 1,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${widget.quantity}",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.indigo,fontWeight: FontWeight.w100),),
                    Text("الكمية",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black54),),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.065,
              width: size.width * 1,
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("\$${widget.price}",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.indigo,fontWeight: FontWeight.w100),),
                    Text("الاجمالي",style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black54),),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.15,
              width: size.width * 1,
              child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("نص الاشعار",style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.black54),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(width: 20,),
                          const Expanded(
                            child: Text(
                              "الطلب مكتملة المعرف : 12138822 معرف العملية",
                              style: TextStyle(fontSize: 17,fontFamily: "Almarai",color: Colors.black87,),
                              maxLines: 2,
                            ),
                          ),
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {  },
                            checkColor: Colors.white,
                            activeColor : Colors.green,
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),

          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text("المنتجات",style: TextStyle(fontSize: 22,fontFamily: "Almarai",color: Colors.black54),),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0.1),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              height: size.height * 0.10,
              width: size.width * 1,
              child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(

                        children: [
                          const SizedBox(width: 20,),

                          const Expanded(
                            child: Text(
                              "الطلب مكتملة المعرف : 12138822 معرف العملية",
                              style: TextStyle(fontSize: 14,fontFamily: "Almarai",color: Colors.black87,),
                              maxLines: 4,
                            ),
                          ),
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {  },
                            checkColor: Colors.white,
                            activeColor : Colors.green,
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }
}



