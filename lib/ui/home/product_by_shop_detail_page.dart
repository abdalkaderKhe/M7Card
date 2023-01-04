import 'package:flutter/material.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
class ProductByShopDetailPage extends StatefulWidget {
  const ProductByShopDetailPage({Key? key}) : super(key: key);
  @override
  State<ProductByShopDetailPage> createState() => _ProductByShopDetailPageState();
}

class _ProductByShopDetailPageState extends State<ProductByShopDetailPage> {
  bool _isLove = false;
  final _buttonColor = const Color.fromRGBO(155, 149, 239, 1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.white,
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
         /*
        leading: const Padding(
          padding:  EdgeInsets.all(9.0),
          child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 1),radius: 13,child: Icon(Icons.person,size: 32,),),
        ),
        */
         // centerTitle: true,
         // title:const Text("كل المحلات",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
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
      body: Stack(
        children: [
          //const BackGroundColor(),
          Column(
            children: [
               SizedBox(
                 width: size.width * 1,
                 height: size.height * 0.3,
                 child: Image.network("https://m7card.manarhays.com/public/images/20221114234157image_190x230-218.png",
                   width: size.width * 1,
                   height: size.height * 0.3,
                   fit: BoxFit.cover,
                 ),
               ),
              _createProductPriceTitleEtc(),

               const SizedBox(height:70),

               SizedBox(
                 height: size.height*0.08,
                 width: size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary:  _buttonColor,
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const[
                      Icon(Icons.shopping_basket,color: Colors.white,),
                      Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),)
                    ],
                  ),
                ),
              ),

            ],

          ),
        ],
      ),
    );
  }


  Widget _createProductPriceTitleEtc(){
    return Container(
      color: Colors.white,
      padding:const EdgeInsets.all(16),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Text("799.2",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),),

               const Text(
                 "999",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                ),),

              const Text("999",
                style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),),

              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_isLove==true){
                      _isLove = false;
                     // Fluttertoast.showToast(msg: AppLocalizations.of(context)!.translate('item_deleted_wishlist')!, toastLength: Toast.LENGTH_LONG);
                    } else {
                      //Fluttertoast.showToast(msg: AppLocalizations.of(context)!.translate('item_added_wishlist')!, toastLength: Toast.LENGTH_LONG);
                      _isLove = true;
                    }
                  });
                },
                child: Icon(
                    Icons.favorite, color: _isLove==true?Colors.red:Colors.grey, size: 28
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          const Text("FreeFire" ,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Almarai",
            color: Color.fromRGBO(73, 70, 97, 1),
          )),

          const SizedBox(height: 12),

          const Text("demo-product-8dkcu" ,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Almarai",
            color: Color.fromRGBO(73, 70, 97, 1),
          )),

          const SizedBox(height: 12),

          IntrinsicHeight(
            child: Row(
              children: [
                GestureDetector(
                  //behavior: HitTestBehavior.translucent,
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductReviewPage()));
                  },
                  child: Row(
                    children: [

                      Icon(Icons.star, color: Colors.grey[700], size: 18),
                      Icon(Icons.star, color: Colors.grey[700], size: 18),
                      Icon(Icons.star, color: Colors.grey[700], size: 18),
                      Icon(Icons.star, color: Colors.grey[700], size: 18),
                      Icon(Icons.star, color: Colors.grey[700], size: 18),

                      const  SizedBox(
                        width: 3,
                      ),

                      const Text("تقييم", style: TextStyle(
                           fontSize: 14,
                        fontWeight: FontWeight.bold,
                          fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                      )),

                      const  SizedBox(
                        width: 20,
                      ),

                      VerticalDivider(
                        width: 40,
                        thickness: 1,
                        color: Colors.grey[300],
                      ),

                      const  SizedBox(
                        width: 10,
                      ),
                      const Text("كل التعليقات", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                      )),

                    ],
                  ),
                ),

              ],
            ),
          ),

          Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey[200],
          ),

         // const SizedBox(height: 12),

          _createProductDescription(),

          Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey[200],
          ),

        ],
      ),
    );
  }

  Widget _createProductDescription(){
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
             Text(('وصف'),
               style: TextStyle(
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 16, fontWeight: FontWeight.bold,
                fontFamily: "Almarai",
               ),
             ),

             SizedBox(
              height: 16,
            ),

             Text('short description',
               style: TextStyle(
                 color: Color.fromRGBO(73, 70, 97, 1),
                 fontSize: 16, fontWeight: FontWeight.bold,
                 fontFamily: "Almarai",
               ),),

             SizedBox(
              height: 16,
            ),

          ],
        )
    );
  }

}
