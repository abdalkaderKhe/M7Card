import 'package:flutter/material.dart';
import 'package:m7card/model/product_by_category.dart';
import 'package:m7card/model/product_by_shop_model.dart';

class ProductDetailPage extends StatefulWidget {
  ProductByShopModel productByShopModel;
  ProductDetailPage({Key? key,required this.productByShopModel}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _buttonColor = const Color.fromRGBO(155, 149, 239, 1);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final double boxImageSize = ((MediaQuery.of(context).size.width)-24)/2-12;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromRGBO(247, 241, 253, 1),
                  Color.fromRGBO(247, 241, 253, 1),
                  Color.fromRGBO(241, 232, 251, 1),
                  Color.fromRGBO(206, 223, 253, 1),
                  Color.fromRGBO(206, 223, 253, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
        ),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
            elevation: 0.7,
            /*
            leading: const Padding(
              padding: EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(229, 232, 239, 1),
                radius: 13,
                child: Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
            ),
             */
            centerTitle: true,
            title:const Center(
              child: Text(
                textDirection : TextDirection.ltr,
                textAlign : TextAlign.end,
                "بطاقة باقات سوا لايك بلس",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 25,
                      color: Color.fromRGBO(133, 116, 231, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/ 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: height / 80,),
                  SizedBox(
                    height: height / 4,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child:Image.network(widget.productByShopModel.image!,
                        fit: BoxFit.cover,
                        width: boxImageSize * 2,
                        height: boxImageSize * 2,
                      ),
                    ),
                  ),

                  SizedBox(height: height / 35,),
                  Text("\$ ${widget.productByShopModel.title}",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),
                      fontSize: 15,fontWeight: FontWeight.w700),),
                  SizedBox(height: height / 90,),
                  Text(
                    textAlign : TextAlign.end,
                    widget.productByShopModel.slug!,
                    //" الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات بافضل"
                    style: TextStyle(wordSpacing:1,height: 1.6,fontFamily: "Almarai",color: Colors.grey.shade500,fontSize: 13,),),

                  SizedBox(height: height / 50,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:  width / 50,vertical: height / 90),
                    height: height / 7,
                    width: double.infinity,
                    decoration:const BoxDecoration(
                      color: Color.fromRGBO(241, 223, 211, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:const [
                            Text("نقطة مع هذه النقطة",style: TextStyle(fontFamily: "Almarai",color: Colors.amber,
                                fontSize: 14,fontWeight: FontWeight.w600),),
                            Icon(Icons.star_rounded,color: Colors.amber,size: 20,),
                            Text("22",style: TextStyle(fontFamily: "Almarai",color: Colors.amber,
                                fontSize: 15,fontWeight: FontWeight.w600),),
                          ],
                        ),

                        SizedBox(height: height / 60,),
                        const Text("بشرائك هذه البطاقة ستحصل على 22 نقطة دليل ستارز لتتعرف عليه أكثر",
                          textAlign: TextAlign.end,
                          style: TextStyle(height: 1.5,fontFamily: "Almarai",color: Colors.grey,
                              fontSize: 13,fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),


                  SizedBox(height: height / 35,),

                  SizedBox(
                    height: height / 18,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary:  Colors.grey,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white,size: 21,),
                          Text("طريقة الاستخدام",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 13,fontWeight: FontWeight.w700),)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height / 45,),
                  SizedBox(
                    height: height / 18,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary:  _buttonColor,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shopping_basket,color: Colors.white,size: 21,),
                          Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
