import 'package:flutter/material.dart';
import 'package:m7card/model/product_by_category.dart';

class ProductPage extends StatefulWidget {
  ProductByCategory productByCategory;
  ProductPage({Key? key,required this.productByCategory}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _buttonColor = const Color.fromRGBO(155, 149, 239, 1);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final double boxImageSize = ((MediaQuery.of(context).size.width)-24)/2-12;
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
            backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
            elevation: 0.7,
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
            centerTitle: true,
            title:const Center(
              child: Text(
                textDirection : TextDirection.ltr,
                textAlign : TextAlign.end,
                "بطاقة باقات سوا لايك بلس",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              ),
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 30,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child:Image.network(widget.productByCategory.image,
                        fit: BoxFit.cover,
                        width: boxImageSize*8,
                        height: boxImageSize*8,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text("\$ ${widget.productByCategory.title}",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
                  const SizedBox(height: 20,),
                   Text(
                    textAlign : TextAlign.end,
                    widget.productByCategory.slug,
                    //" الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات استمتع بافضل الخدمات بافضل"
                    style: TextStyle(wordSpacing:1,height: 1.6,fontFamily: "Almarai",color: Colors.grey.shade500,fontSize: 14,),),

                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(25),
                    height: 150,
                    width: double.infinity,
                    decoration:const BoxDecoration(
                      color: Color.fromRGBO(241, 223, 211, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:const [
                            Text("نقطة مع هذه النقطة",style: TextStyle(fontFamily: "Almarai",color: Colors.amber,fontSize: 17,fontWeight: FontWeight.w600),),
                            Icon(Icons.star_rounded,color: Colors.amber,size: 25,),
                            Text("22",style: TextStyle(fontFamily: "Almarai",color: Colors.amber,fontSize: 17,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        const Text("بشرائك هذه البطاقة ستحصل على 22 نقطة دليل ستارز لتتعرف عليه أكثر",
                          textAlign: TextAlign.end,
                          style: TextStyle(height: 1.5,fontFamily: "Almarai",color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),

                  SizedBox(
                    height: 60,width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary:  Colors.grey,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white,),
                          Text("طريقة الاستخدام",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),)
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25,),
                  SizedBox(
                    height: 60,width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary:  _buttonColor,
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shopping_basket,color: Colors.white,),
                          Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),)
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
