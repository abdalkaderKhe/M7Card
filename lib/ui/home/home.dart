import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/bloc/home/slider/slider_bloc.dart';
import 'package:m7card/model/slider_model.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/ui/account/add_coupon_code.dart';
import 'package:m7card/ui/account/edit_account_Information_page.dart';
import 'package:m7card/ui/account/settings_page.dart';
import 'package:m7card/ui/account/technical_support_tickets.dart';
import 'package:m7card/ui/authentication/signin/signin_email_or_phone_page.dart';
import 'package:m7card/ui/home/economize_page.dart';
import 'package:m7card/ui/home/product_by_shop_detail_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/category/all_category/all_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/category_card_item.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/shop/all_shops/all_shops_bloc.dart';
import '../../main.dart';
import '../../model/shop.dart';
import 'bottom_nav_bar.dart';
import 'category_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<CategoryModel> categoryData = [];
  late AllCategoryBloc _allCategoryBloc;
  bool _lastDataAllCategory = false;

  List<SliderModel> sliderData = [];
  late SliderBloc _sliderBloc;
  bool _lastDataSlider = false;

  
  List<Shop> shopData = [];
  late AllShopsBloc _allShopsBloc;
  bool _lastDataAllShops = false;





  @override
  void initState() {
    super.initState();
    //_checkIsLogin();

    _allShopsBloc = BlocProvider.of<AllShopsBloc>(context);
    _allShopsBloc.add(GetAllShops());

    _allCategoryBloc = BlocProvider.of<AllCategoryBloc>(context);
    _allCategoryBloc.add(GetAllCategory());

    _sliderBloc = BlocProvider.of<SliderBloc>(context);
    _sliderBloc.add(GetSlider());
  }



  /*
  Future<void> _checkIsLogin() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin;
    isLogin = await sharedPreferences.getBool("isLogin")!;

    setState(() {
      _isLogin = isLogin;
    });

    if(_isLogin == true)
    {
        _getToken().whenComplete((){
        _userProfileBloc = BlocProvider.of<UserProfileBloc>(context);
        _userProfileBloc.add(UserProfileButtonPressEvent(token: _token));
      });
    }
  }
   */

  /*
  Future<String?> _getToken() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token')!;
    print("=======_token======");
    print(_token);
    return _token;
  }
   */

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
    children: [
      const BackGroundColor(),
      Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: false,
        drawerScrimColor: Colors.transparent,
        endDrawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding:const EdgeInsets.all(9.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EconomizePage()),
                );
              },
              child:LandingPage.isCheck ? CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:NetworkImage(LandingPage.userProfile.image),
                radius: 25.0,
              ) : const CircleAvatar(
                backgroundColor: Color.fromRGBO(229, 232, 239, 1),
                radius: 13,
                child: Icon(Icons.person, size: 32,),
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "الرئيسية",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900
            ),
          ),
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

        body: SafeArea(
          child: SingleChildScrollView(
            child: MultiBlocListener(
              listeners:[
                BlocListener<AllCategoryBloc, AllCategoryState>(
                  listener: (BuildContext context, state)
                  {
                    if(state is CategoryError) {
                      "_globalFunction.showToast(type: 'error', message: state.errorMessage)";
                    }
                    if(state is GetCategorySuccess) {
                      if(state.categoryData.length==0){
                        _lastDataAllCategory = true;
                      }
                      else
                      {
                        categoryData.addAll(state.categoryData);
                      }
                    }
                  },
                ),
                BlocListener<SliderBloc, SliderState>(
                  listener: (BuildContext context, state)
                  {
                    if(state is GetSliderError) {
                      "_globalFunction.showToast(type: 'error', message: state.errorMessage)";
                    }
                    if(state is GetSliderSuccess) {
                      if(state.sliderData.length==0)
                      {
                        _lastDataSlider = true;
                      }
                      else
                      {
                        sliderData.addAll(state.sliderData);
                      }
                    }
                  },
                ),
                /*
                BlocListener<UserProfileBloc,UserProfileState>(
                  listener: (BuildContext context, state)
                  {
                    if(state is GetUserProfileWaiting)
                    {
                      print("GetUserProfileWaiting");
                    }
                    if(state is GetUserProfileError)
                    {
                      print("GetUserProfileError");
                    }
                    if(state is GetUserProfileSuccess)
                    {
                      print("GetUserProfileSuccess");
                      _isLogin ? userProfile = state.userProfile : "";
                      setState(() {});
                    }
                  },
                ),
                 */
                BlocListener<AllShopsBloc, AllShopsState>(
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
                )
              ],



              child: Column(
                children: <Widget>[
                  BlocBuilder<SliderBloc, SliderState>(

                      builder: (BuildContext context, state){
                        if(state is GetSliderError)
                        {
                          return Center(
                              child: Text(state.errorMessage, style: const TextStyle(
                                fontSize: 14,
                                color: BLACK_GREY,
                              ))
                          );
                        }
                        else
                        {
                          if(_lastDataSlider)
                          {
                            return Wrap();
                          }
                          else
                          {
                            if(sliderData.length==0)
                            {
                              return const Padding(
                                padding:EdgeInsets.only(top: 50),
                                child:  Center(child: CircularProgressIndicator(color:Color.fromRGBO(206, 223, 253, 1),)),
                              );
                            }
                            else
                            {
                              return
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: height / 4,
                                    aspectRatio: 16/9,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.81,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration: Duration(milliseconds: 950),
                                    autoPlay: true,
                                    scrollDirection:Axis.horizontal,
                                  ),
                                  itemCount:sliderData.length,
                                  itemBuilder: (BuildContext context, int index, int realIndex) {
                                    return AnimatedContainer(
                                      height: height / 4 ,
                                      width: width  / 1.1 ,
                                      color: Colors.transparent,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                      child: Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        child: Image.network(
                                          sliderData[index].sliderImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                            }
                          }
                        }

                      }
                  ),

                  SizedBox(height: height / 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BlocBuilder<AllCategoryBloc, AllCategoryState>(
                      builder: (BuildContext context, state){
                        if(state is CategoryError)
                        {
                          return Container(
                              child: const Center(
                                  child: Text(ERROR_OCCURED, style: TextStyle(
                                    fontSize: 14,
                                    color: BLACK_GREY,
                                  ))
                              )
                          );
                        }
                        else
                        {
                          if(_lastDataAllCategory){
                            return Wrap();
                          } else {
                            if(categoryData.length==0){
                              return const Padding(
                                padding:EdgeInsets.only(top: 50),
                                child:  Center(child: CircularProgressIndicator(color:Color.fromRGBO(206, 223, 253, 1),)),
                              );
                            }
                            else
                            {
                              return _buildCategories(context, categoryModelList: categoryData);
                            }
                          }
                        }
                      },
                      //child: _buildBody(context),
                    ),
                  ),





                  const SizedBox(height: 15),
                  BlocBuilder<AllShopsBloc, AllShopsState>(
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
                              return _buildAllShopsGridView(context,shopDataList: shopData,);
                            }
                          }
                        }
                      }
                  ),
                  //_buildAllShopsGridView(context),
                ],
              ),
            ),

          ),
        ),
      ),
    ]);
  }

  Widget _buildCategories(BuildContext context, {required List<CategoryModel> categoryModelList})
  {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 3,
          childAspectRatio:1.1,
        ),
        itemCount: categoryModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCardItem(title: categoryModelList[index].title, imageUrl: categoryModelList[index].image, categoryId: categoryModelList[index].id,);
        }
    );
  }
  

  Widget _buildAllShopsGridView(BuildContext context,{required List<Shop> shopDataList})
  {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemCount: shopDataList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductByShopDetailPage(shopModel: shopDataList[index],),
                  ),
                );
              },
              child: ProductsByShopCardItem(shopModel: shopDataList[index],),
            );
          }
      ),
    );
  }
}




class ProductsByShopCardItem extends StatelessWidget {
  Shop shopModel;
  ProductsByShopCardItem({Key? key, required this.shopModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 9,
              width:   width / 2.2,
              child: Card(
                margin:EdgeInsets.all(0),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
                ),
                child: Image.network(shopModel.banner,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: height / 8.5,
              width:  width / 2.2,
              child:  Card(
                margin:EdgeInsets.all(0),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:  Radius.circular(15)),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    SizedBox(height: 25,),
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: shopModel.reviewsCount.toDouble(),
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
                    SizedBox(height: 8,),
                    Text("null",
                      //shopModel.title! == null : "null" ? shopModel.title,
                      style: TextStyle(
                          fontFamily: "Almarai",
                          color: Color.fromRGBO(73, 70, 97, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height / 17,
          width:  width / 8,
          child:Center(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 51,
              child: CircleAvatar(
                foregroundImage :NetworkImage(shopModel.logo,scale: 50),
                radius: 49,
                // child: Image.network(shopModel.logo,fit: BoxFit.fill,),
              ),
            )
          ),
        ),
      ],
    );
  }
}

















//Padding(padding: EdgeInsets.only(bottom: 70),child: Container(
//           height: height / 18,
//           width:  width / 8,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.all(
//               Radius.circular(35),
//             ),
//           ),
//         ),),












































//بطاقات شحن
/*
              SizedBox(
                height: 380,
                width: double.infinity,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildItem(context),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "بطاقات شحن",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildItem(context),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "بطاقات شحن",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildItem(context),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "بطاقات شحن",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildItem(context),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "بطاقات شحن",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Color.fromRGBO(73, 70, 97, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               */
//const SizedBox(height: 20),
// "آخر البطاقات المضافة",

/*
                const Padding(
                  padding:  EdgeInsets.only(left: 190.0),
                  child:  Text(
                    "آخر البطاقات المضافة",
                    style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                */


// story
/*
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding:const EdgeInsets.all(2),
                        sliver: SliverGrid(
                          gridDelegate:
                            const   SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1.2,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  CircularPercentIndicator(
                                    widgetIndicator: Container(
                                      color: Colors.grey,
                                      height: 20,
                                      width: 20,
                                    ),
                                    backgroundColor:
                                     const Color.fromRGBO(133, 116, 231, 1),
                                    radius: 35,
                                    lineWidth: 4,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const CategoryPage(),
                                        ),
                                      );
                                    },
                                    child: CircleAvatar(
                                      child:  Image.asset(
                                        "assets/images/logo.png",
                                      ),
                                      radius: 24,
                                    ),
                                  ),
                                ],
                              );
                            },
                            childCount: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               */
//البطاقات الأكثر مبيعا
/*
                const Padding(
                  padding: EdgeInsets.only(left: 200, top: 15),
                  child: Text(
                    "البطاقات الأكثر مبيعا",
                    style: TextStyle(
                        fontFamily: "Almarai",
                        color: Color.fromRGBO(73, 70, 97, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                 */


/*
                /*
                CustomScrollView(
                  shrinkWrap: true,
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        crossAxisCount: 3,
                        children: <Widget>[
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                          _cardItem(context),
                        ],
                      ),
                    ),
                  ],
                ),
                 */
 */






































/*
BlocListener<AllCategoryBloc, AllCategoryState>(
            listener: (BuildContext context, state) {
              if(state is CategoryError) {
                "_globalFunction.showToast(type: 'error', message: state.errorMessage)";
              }
              if(state is GetCategorySuccess) {
                if(state.categoryData.length==0){
                  _lastDataAllCategory = true;
                }
                else
                {
                  categoryData.addAll(state.categoryData);
                }
              }
            },
      ),
 */




/*
Widget _cardItem(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 130,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "غوغل بلاي",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 13),
        ),
      ],
    );
  }
 */
/*
  Widget _cardItem(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 130,
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "غوغل بلاي",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 13),
        ),
      ],
    );
  }
  Widget _buildItem(BuildContext context) {
    return Container(
      height: 340,
      width: 230,
      color: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),
    );
  }
 */










/*
 CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    aspectRatio: 16/9,
                    viewportFraction: 0.94,
                    autoPlay: true,
                  ),
                  items: [1,2,3,4,5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  //width: 400,
                                  color: Colors.transparent,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                      "assets/images/logo.png",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "بطاقات شحن",
                                  style: TextStyle(
                                      fontFamily: "Almarai",
                                      color: Color.fromRGBO(73, 70, 97, 1),
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
 */


















