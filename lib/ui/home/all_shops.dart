import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/shop/all_shops/all_shops_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/shop.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';

import 'product_by_shop_detail_page.dart';
class AllShops extends StatefulWidget {
  const AllShops({Key? key}) : super(key: key);
  @override
  State<AllShops> createState() => _AllShopsState();
}
class _AllShopsState extends State<AllShops> {

  //AllShops
  List<Shop> shopData = [];
  late AllShopsBloc _allShopsBloc;
  bool _lastDataAllShops = false;

  @override
  void initState() {
    super.initState();
    _allShopsBloc = BlocProvider.of<AllShopsBloc>(context);
    _allShopsBloc.add(GetAllShops());
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundColor(),
        Scaffold(
          backgroundColor :Colors.transparent,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Padding(
              padding:  EdgeInsets.all(9.0),
              child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 1),radius: 13,child: Icon(Icons.person,size: 32,),),
            ),
            centerTitle: true,
            title:const Text("كل المحلات",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
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
          drawerScrimColor: Colors.transparent,
          endDrawer: const CustomDrawer(),
          body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: BlocListener<AllShopsBloc, AllShopsState>(
                listener: (BuildContext context, state) {
                  if(state is ShopError) {
                    "_globalFunction.showToast(type: 'error', message: state.errorMessage)";
                  }
                  if(state is GetAllShopsSuccess) {
                    if(state.shopData.length==0){
                      _lastDataAllShops = true;
                    }
                    else
                    {
                      shopData.addAll(state.shopData);
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<AllShopsBloc, AllShopsState>(
                    builder: (BuildContext context, state){
                      if(state is ShopError)
                      {
                        return const SizedBox(
                            child:Center(
                                child: Text(ERROR_OCCURED, style: TextStyle(
                                  fontSize: 14,
                                  color: BLACK_GREY,
                                ))
                            )
                        );
                      }
                      else
                      {
                        if(_lastDataAllShops)
                        {
                          return Wrap();
                        }
                        else
                        {
                          if(shopData.length==0){
                            return const Padding(
                              padding:EdgeInsets.only(top: 200),
                              child:  Center(child: CircularProgressIndicator(color:Color.fromRGBO(206, 223, 253, 1),)),
                            );
                          }
                          else
                          {
                            return _buildProductGrid(context,shopDataList: shopData,);
                          }
                        }
                      }
                    },
                    //child: _buildBody(context),
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid(context, {required List<Shop> shopDataList}){
    return MediaQuery.removePadding(
      context: context,
      //removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            childAspectRatio : 0.69,
          ),
          itemCount: shopDataList.length,
          itemBuilder: (BuildContext context, int index) {
            return buildShopItem(context, shopData: shopDataList[index],);
          }
      ),
    );
  }

  Widget buildShopItem(context,{required Shop shopData}){
    final double boxImageSize = ((MediaQuery.of(context).size.width)-14)/2-12;
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1,
        color: Colors.white,
        child: GestureDetector(
          onTap:() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  ProductByShopDetailPage(),
              ),
            );
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Image.network(
                  shopData.banner,
                  fit: BoxFit.cover,
                  width: boxImageSize,
                  height: boxImageSize,
                ),
              ),
              Container(
                margin:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    const Text(
                      "null",
                      style:TextStyle(color:Color(0xFF515151),fontSize: 14,fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    // shop_name
                    Text(
                      shopData.shopName,
                      style:const TextStyle(color:Color(0xFF515151),fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    // slug
                    Text(
                      shopData.slug,
                      style:const TextStyle(color:Color(0xFF515151),fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Row(children:const [
                        Icon(Icons.star,color: Colors.grey,),
                        Icon(Icons.star,color: Colors.grey,),
                        Icon(Icons.star,color: Colors.grey,),
                        Icon(Icons.star,color: Colors.grey,),
                        Icon(Icons.star,color: Colors.grey,),
                      ],),
                      Image.network(
                        shopData.logo,
                        fit: BoxFit.cover,
                        width: boxImageSize/8,
                        height: boxImageSize/8,
                      ),
                     ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





/*
Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildProductGrid(context,"title","slug","shopName","assets/images/logo.png"),
                ),
 */
/*
final double boxImageSize = ((MediaQuery.of(context).size.width)-24)/2-12;
SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Image.network(
                  shopData.banner,
                  fit: BoxFit.cover,
                  width: boxImageSize,
                  height: boxImageSize,
                ),
              ),
              Container(
                margin:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      shopData.title,
                      style:const TextStyle(color:Color(0xFF515151),fontSize: 14,fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    // shop_name
                    Text(
                      shopName,
                      style:const TextStyle(color:Color(0xFF515151),fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    // slug
                    Text(
                      slug,
                      style:const TextStyle(color:Color(0xFF515151),fontSize: 12,), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
 */