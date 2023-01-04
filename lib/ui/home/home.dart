import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
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
import 'package:m7card/utilities/account/user_profile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/category/all_category/all_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/category_card_item.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  bool _isLogin = false;
  late String _token;

  late UserProfileBloc _userProfileBloc;
  UserProfile userProfile = UserProfile(id: 0, firstName: '', lastName: '', email: '', phone: '', gender: '', dateOfBirth: '', image: '', facebook: '', twitter: '', linkedin: '', instagram: '', pinterest: '', youtube: '');


  @override
  void initState() {
    super.initState();

    _checkIsLogin();

    _allCategoryBloc = BlocProvider.of<AllCategoryBloc>(context);
    _allCategoryBloc.add(GetAllCategory());

    _sliderBloc = BlocProvider.of<SliderBloc>(context);
    _sliderBloc.add(GetSlider());
  }


  Future<void> _checkIsLogin() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin;
    isLogin = sharedPreferences.getBool("isLogin")!;

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

  Future<String?> _getToken() async
  {
    var sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('token')!;
    print("=======_token======");
    print(_token);
    return _token;
  }


  @override
  Widget build(BuildContext context) {
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
              child:_isLogin ? CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:NetworkImage(userProfile.image),
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
                fontWeight: FontWeight.w900),
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

        body: SingleChildScrollView(

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
            ],

            child: Column(
              children: <Widget>[
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

                const SizedBox(height: 10),

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
                            return CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 250,
                                aspectRatio: 16/9,
                                viewportFraction: 0.94,
                                autoPlay: true,
                              ),
                              itemCount:sliderData.length,
                              itemBuilder: (BuildContext context, int index, int realIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 400,
                                          color: Colors.transparent,
                                          child: Card(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            child: Image.network(sliderData[index].sliderImage,fit: BoxFit.cover,),
                                          ),
                                        ),

                                         /*
                                         Text(
                                          sliderData[index].title,
                                          style:const TextStyle(
                                              fontFamily: "Almarai",
                                              color: Color.fromRGBO(73, 70, 97, 1),
                                              fontSize: 16),
                                        ),
                                          */
                                      ],
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 15),
              ],
            ),
          ),

        ),
      ),
    ]);
  }

  Widget _buildCategories(BuildContext context, {required List<CategoryModel> categoryModelList})
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
            crossAxisCount: 3,
          ),
          itemCount: categoryModelList.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCardItem(title: categoryModelList[index].title, imageUrl: categoryModelList[index].image, categoryId: categoryModelList[index].id,);
          }
      ),
    );
  }

}






































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


















