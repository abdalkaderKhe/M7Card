import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/bloc/category/products_by_category/products_by_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/product_by_category.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/ui/home/economize_page.dart';
import 'package:m7card/ui/home/product_page.dart';
import 'package:m7card/ui/shopping_cart/payment_form.dart';
import 'package:m7card/ui/shopping_cart/shopping_cart_page.dart';
import 'package:m7card/ui/widgets/backgroud_color.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CategoryPage extends StatefulWidget {
  String title;
  int categoryId;
  CategoryPage({Key? key,required this.categoryId , required this.title}) : super(key: key);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {
  //final String _title = "رصيد بطاقات";
  final Color _buttonColor =const Color.fromRGBO(155, 149, 239, 1);

  List<ProductByCategory> productByCategoryData = [];
  late ProductsByCategoryBloc _productsByCategoryBloc;
  bool _lastDataProductsByCategory = false;


  bool _isLogin = false;
  late String _token;

  late UserProfileBloc _userProfileBloc;
  UserProfile userProfile = UserProfile(id: 0, firstName: '', lastName: '', email: '', phone: '', gender: '', dateOfBirth: '', image: '', facebook: '', twitter: '', linkedin: '', instagram: '', pinterest: '', youtube: '');

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
    return _token;
  }

  @override
  void initState() {
    super.initState();
    _checkIsLogin();

    _productsByCategoryBloc = BlocProvider.of<ProductsByCategoryBloc>(context);
    _productsByCategoryBloc.add(GetProductsByCategory(CategoryID: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        const BackGroundColor(),
        Scaffold(
          backgroundColor :Colors.transparent,
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
            title: Text(widget.title,style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
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
          body: MultiBlocListener(
          listeners: [
              BlocListener<ProductsByCategoryBloc, ProductsByCategoryState>(
                listener: (BuildContext context, state) {
                  if (state is GetProductsByCategoryError) {
                    print(state.errorMessage);
                  }
                  if (state is GetProductsByCategorySuccess) {
                    if (state.productByCategoryData.length == 0) {
                      _lastDataProductsByCategory = true;
                    } else {
                      productByCategoryData.addAll(state.productByCategoryData);
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
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 280,top: 15),
                      child: Text("بطاقات رصيد",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w700),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),

                      child: BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
                        builder: (BuildContext context, state){
                          if(state is GetProductsByCategoryError)
                          {
                            return const SizedBox(
                                child: Center(
                                    child: Text(ERROR_OCCURED, style: TextStyle(
                                      fontSize: 14,
                                      color: BLACK_GREY,
                                    ))
                                )
                            );
                          }
                          else
                          {
                            if(_lastDataProductsByCategory){
                              return Wrap();
                            }
                            else
                            {
                              if(productByCategoryData.length==0){
                                return const Padding(
                                  padding:EdgeInsets.only(top: 250),
                                  child:  Center(child: CircularProgressIndicator(color:Color.fromRGBO(206, 223, 253, 1),)),
                                );
                              }
                              else
                              {
                                return GridView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4,
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.8,
                                    ),
                                    itemCount: productByCategoryData.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return _cardItem(
                                          context,
                                          productByCategoryData[index].price,
                                          productByCategoryData[index].totalReviews,
                                          productByCategoryData[index].image,
                                          productByCategoryData[index].title,
                                          productByCategoryData[index],
                                      );
                                    }
                                );
                              }
                            }
                          }
                        },
                        //child: _buildBody(context),
                      ),

                    ),

                    const SizedBox(height: 40,),
                    const Padding(
                      padding: EdgeInsets.only(left: 230.0),
                      child:Text("طريقة الاستخدام",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w600),),
                    ),

                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: _buttonColor,
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          width: 250,
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const [
                              Icon(Icons.arrow_back,color: Colors.white,),
                              SizedBox(width: 9,),
                              Text("طريقة الاستخدام",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary:const Color.fromRGBO(82, 81, 112, 1),
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          width: 250,
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const [
                              Icon(Icons.arrow_back,color: Colors.white,),
                              SizedBox(width: 9,),
                              Text("تواصل مع خدمة العملاء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _cardItem(BuildContext context,int price,int totalReviews,String imageUrl,String title,ProductByCategory productByCategory){
    //String totalReviewsNumber = totalReviews.toString();
    return InkWell(
      onTap: (){
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(productByCategory: productByCategory,),
          ),
        );},
      child: SizedBox(
        width: 220,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding:const EdgeInsets.all(8.0),
                      child: Text("${price.toString()} \$" ,style: const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 16,fontWeight: FontWeight.w900),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title ,style: const TextStyle(fontFamily: "Almarai",color:Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                    ),

                  ],
                ),

                /*

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      const Icon(Icons.star_sharp,color: Colors.amber,),
                      Padding(
                        padding:const EdgeInsets.only(left: 5.0,top: 6),
                        child: Text(totalReviews.toString(),style: const TextStyle(fontFamily: "Almarai",color: Colors.amber,fontSize: 13,fontWeight: FontWeight.w900),),
                      ),
                    ],),
                ),
                const SizedBox(height: 10,),

 */


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary:  _buttonColor,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  PaymentForm(productByCategory: productByCategory,),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Icon(Icons.shopping_basket,color: Colors.white,),
                      Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






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
                          crossAxisCount: 2,
                          childAspectRatio: 0.57,
                          children: <Widget>[
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
