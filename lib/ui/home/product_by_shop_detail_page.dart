import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:m7card/ui/home/product_detail_page.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';

import '../../bloc/category/all_category/all_category_bloc.dart';
import '../../bloc/shop/products_by_shop/products_by_shop_bloc.dart';
import '../../config/constants.dart';
import '../../model/product_by_shop.dart';
import '../../model/product_by_shop_model.dart';
import '../../model/shop.dart';
import '../widgets/category_card_item.dart';
import 'category_page.dart';
class ProductByShopDetailPage extends StatefulWidget {
  Shop shopModel;
  ProductByShopDetailPage({Key? key,required this.shopModel}) : super(key: key);
  @override
  State<ProductByShopDetailPage> createState() => _ProductByShopDetailPageState();
}

class _ProductByShopDetailPageState extends State<ProductByShopDetailPage> {
  List<ProductByShopModel> productByShopData = [];
  late ProductsByShopBloc _productByShopBloc;
  bool _lastProductByShopCategory = false;

  @override
  void initState() {
    super.initState();
    _productByShopBloc = BlocProvider.of<ProductsByShopBloc>(context);
    _productByShopBloc.add(GetProductsByShop(proudctID: 1));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Colors.grey.shade100,
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        centerTitle: true,
        title: Text(
          "null",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: BlocListener<ProductsByShopBloc, ProductsByShopState>(
        listener: (BuildContext context, state) {
          if (state is GetProductsByShopSuccess)
          {
            print("GetProductsByShopSuccess");
            if (state.productByShopData.length == 0)
            {
              _lastProductByShopCategory = true;
            }
            else
            {
              print("productByShopData.addAll(state.productByShopData)");
              productByShopData.addAll(state.productByShopData);
              print(productByShopData.first.title);
            }
          }
          if (state is GetProductsByShopError)
          {
            print("GetProductsByShopError");
            print(state.errorMessage);
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: height / 4,
              width: width / 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: height / 4,
                    width: width / 1,
                    child:Image.network(widget.shopModel.banner,fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 115),
                    child: Container(
                      height: height / 10,
                      width: width / 1,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 100),child:  Column(
                    children: [
                      SizedBox(
                        height: height / 17,
                        width:  width / 8,
                        child:Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 51,
                              child: CircleAvatar(
                                foregroundImage :NetworkImage(widget.shopModel.logo,scale: 50),
                                radius: 49,
                                // child: Image.network(shopModel.logo,fit: BoxFit.fill,),
                              ),
                            )
                        ),
                      ),
                      Text(
                        "null",
                        style: TextStyle(
                            fontFamily: "Almarai",
                            color: Color.fromRGBO(73, 70, 97, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: widget.shopModel.reviewsCount.toDouble(),
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            BlocBuilder<ProductsByShopBloc,ProductsByShopState>(
                builder: (BuildContext context,state){
                  if(state is GetProductsByShopError)
                  {
                    return SizedBox(
                        child:  Center(
                            child: Text(state.errorMessage, style: TextStyle(
                              fontSize: 14,
                              color: BLACK_GREY,
                            ))
                        )
                    );
                  }
                  if(state is GetProductsByShopWaiting)
                  {
                    return Center(child: CircularProgressIndicator(color: Colors.blue,),);
                  }
                  if(state is GetProductsByShopSuccess)
                  {
                    if(_lastProductByShopCategory)
                    {
                      return Wrap();
                    }
                    else
                    {
                      return _buildBody(context, productByShopModelModelList: productByShopData,);
                    }
                  }
                  return SizedBox();
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardItem(BuildContext context, int price,String imageUrl,String title,ProductByShopModel productByShopModel){
    return SizedBox(
      width: 220,
      child: GestureDetector(
        onTap: ()
        {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(productByShopModel: productByShopModel,),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child:Image.network(imageUrl,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Padding(
                      padding:const EdgeInsets.all(8.0),
                      child: Text("${price.toString()} \$" ,style: const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(title ,style: const TextStyle(fontFamily: "Almarai",color:Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildBody(BuildContext context, {required List<ProductByShopModel> productByShopModelModelList})
  {
    final double boxImageSize = ((MediaQuery.of(context).size.width)-14)/2-12;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 2,
            childAspectRatio : 1,
          ),
          itemCount: productByShopModelModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardItem(
                context,
                productByShopModelModelList[index].discountPrice!,
                productByShopModelModelList[index].image!,
                productByShopModelModelList[index].title!,
                productByShopModelModelList[index],
            );
          }
      ),
    );
  }

}





/*
BlocBuilder<ProductsByShopBloc,ProductsByShopState>(
                builder: (BuildContext context,state){
                  if(state is GetProductsByShopError)
                    {
                      return SizedBox(
                          child:  Center(
                              child: Text(state.errorMessage, style: TextStyle(
                                fontSize: 14,
                                color: BLACK_GREY,
                              ))
                          )
                      );
                    }
                  else
                  {
                    if(_lastProductByShopCategory){
                      return Wrap();
                    }else{
                      return Text(productByShopData.first.title);
                    }
                  }
                }
            ),
 */

/*
Column(
                        children: [
                          SizedBox(
                            height: height / 4,
                            width: width / 1,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: height / 4,
                                  width: width / 1,
                                  child:Image.network(widget.shopModel.banner,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 115),
                                  child: Container(
                                    height: height / 10,
                                    width: width / 1,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 100),child:  Column(
                                  children: [
                                    SizedBox(
                                      height: height / 17,
                                      width:  width / 8,
                                      child:Center(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 51,
                                            child: CircleAvatar(
                                              foregroundImage :NetworkImage(widget.shopModel.logo,scale: 50),
                                              radius: 49,
                                              // child: Image.network(shopModel.logo,fit: BoxFit.fill,),
                                            ),
                                          )
                                      ),
                                    ),
                                    Text(
                                      "null",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    RatingBar.builder(
                                      itemSize: 25,
                                      initialRating: widget.shopModel.reviewsCount.toDouble(),
                                      minRating: 0.5,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),),
                              ],
                            ),
                          ),

                        ],
                      )
 */



/*
Stack(
        children: [
          const BackGroundColor(),
          Column(
            children: [
              SizedBox(
                height: height / 4,
                width: width / 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: height / 4,
                      width: width / 1,
                      child:Image.network(widget.shopModel.banner,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 115),
                      child: Container(
                      height: height / 10,
                      width: width / 1,
                      color: Colors.black.withOpacity(0.3),
                     ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 100),child:  Column(
                      children: [
                        SizedBox(
                          height: height / 17,
                          width:  width / 8,
                          child:Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 51,
                                child: CircleAvatar(
                                  foregroundImage :NetworkImage(widget.shopModel.logo,scale: 50),
                                  radius: 49,
                                  // child: Image.network(shopModel.logo,fit: BoxFit.fill,),
                                ),
                              )
                          ),
                        ),
                        Text(
                          "null",
                          style: TextStyle(
                              fontFamily: "Almarai",
                              color: Color.fromRGBO(73, 70, 97, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        RatingBar.builder(
                          itemSize: 25,
                          initialRating: widget.shopModel.reviewsCount.toDouble(),
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
 */
