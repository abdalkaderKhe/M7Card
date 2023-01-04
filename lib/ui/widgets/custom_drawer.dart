import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/drawer/game_categories/game_categories_bloc.dart';
import 'package:m7card/bloc/drawer/giftcards_categories/giftcards_categories_bloc.dart';
import 'package:m7card/bloc/drawer/onlineshops_categories/onlineshops_categories_bloc.dart';
import 'package:m7card/bloc/drawer/services_categories/services_categories_bloc.dart';
import 'package:m7card/bloc/drawer/socialapps_categories/socialapps_categories_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/ui/home/all_shops.dart';
import 'package:m7card/ui/home/category_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {

  final List<String> _titles = [
    "متاجر رقمية",
    "منصات العاب",
    "الاتصالات والبيانات",
    "بطاقات تسوق",
    "خدمات واشتراكات",
    "الشحن المباشر",
    "محلات"
  ];

  final List<String> _apiUrls = [
    GAME_CATEGORIES,
    ONLINE_SHOPS_CATEGORIES,
    SERVICES_CATEGORIES,
    SOCIAlL_APPS_CATEGORIES,
    GIFTCARDS_CATEGORIES,
  ];

 final List<IconData> _icons = [
    Icons.grain,
    FontAwesomeIcons.gamepad,
    Icons.wifi,
    Icons.shopping_basket,
    Icons.share_sharp,
    Icons.local_shipping,
    Icons.holiday_village_sharp
  ];

  bool isExpanded = false;

  late int index;

  List<CategoryModel> categoryData = [];
  late GameCategoriesBloc _getCategoryBloc;
  bool _lastDataGameCategories = false;

  @override
  void initState() {
    super.initState();
    _getCategoryBloc = BlocProvider.of<GameCategoriesBloc>(context);
    _getCategoryBloc.add(GetGameCategories(url: _apiUrls[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            width: 330,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(130, 113, 227, 1),
                Color.fromRGBO(132, 116, 225, 1),
                Color.fromRGBO(132, 116, 225, 1),
                Color.fromRGBO(137, 120, 224, 1),
                Color.fromRGBO(144, 129, 220, 1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              // السهم
              Padding(
                padding: const EdgeInsets.only(left: 320.0),
                child: IconButton(
                    onPressed: () {Navigator.pop(context);},
                    icon:const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              const SizedBox(height: 30,),

              //"أقسام البطاقات"
              const Padding(
                padding: EdgeInsets.only(left: 200.0, right: 15),
                child: Text(
                  "أقسام البطاقات",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 50,),

               isExpanded ? _subTitlesMenus() : _titlesMenus(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titlesMenus() {
    return SizedBox(
      height: 450,
      width: 330,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _titles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 5, left: 8),
              child: InkWell(
                onTap: () {
                  if(_titles[index] == "محلات"){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AllShops(),
                      ),
                    );
                  }
                  else
                  {
                    setState(() {
                      this.index = index;
                      isExpanded = true;
                    });
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              _icons[index],
                              color: Colors.white,
                              size: 25,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _titles[index],
                          style:const TextStyle(
                              fontFamily: "Almarai",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 26,
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _subTitlesMenus() {
    return BlocListener<GameCategoriesBloc,GameCategoriesState>(
      listener: (BuildContext context, state){
        if(state is GetGameCategoriesLoading){
          print("GetGameCategoriesLoading");
        }
        if(state is GetGameCategoriesSuccess){
          if(state.categoryData.length==0)
          {
            _lastDataGameCategories = true;
          }
          else
          {
            categoryData.addAll(state.categoryData);
          }
        }
        if(state is GetGameCategoriesError){
          print("GetGameCategoriesError");
        }
      },
      child:BlocBuilder<GameCategoriesBloc,GameCategoriesState>
        (
          builder: (BuildContext context, state){
            if(state is GetGameCategoriesError)
            {
              return SizedBox(child: Center(child: Text(state.errorMessage,style: const TextStyle(fontSize: 18,color: Colors.white),),),);
            }
            if(state is GetGameCategoriesLoading)
            {
              return const Center(child: CircularProgressIndicator(color: Colors.white,),);
            }
            if(state is GetGameCategoriesSuccess)
            {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(134, 132, 242, 0.8),
                      borderRadius:  BorderRadius.all(Radius.elliptical(200, 200)),
                    ),
                    height: 565,
                    width: 80,
                  ),
                  SizedBox(
                      height: 550,
                      width: 340,
                      child:Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.categoryData.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0, right: 90, left: 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print("categoryData");
                                      },
                                      child:
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 35,width: 50,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>  CategoryPage(categoryId: state.categoryData[index].id, title: '',),
                                                  ),
                                                );
                                              },
                                              child: CircleAvatar(
                                                backgroundImage:NetworkImage(state.categoryData[index].image,),
                                                backgroundColor: Colors.white,
                                                radius: 20,
                                                // child: Image.network(state.categoryData[index].image,fit: BoxFit.cover,),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            state.categoryData[index].title,
                                            style:const TextStyle(
                                                fontFamily: "Almarai",
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                        height: 420,
                        width: 105,
                        child:Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: _titles.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0, right: 5, left: 8),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: ()
                                                    {
                                                      if(_titles[index] == "محلات"){
                                                        Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                            builder: (context) => const AllShops(),
                                                          ),
                                                        );
                                                      }
                                                      else
                                                      {
                                                        _getCategoryBloc.add(GetGameCategories(url:_apiUrls[index]));
                                                      }
                                                    },
                                                    /************/
                                                    icon: Icon(
                                                      _icons[index],
                                                      color: Colors.white,
                                                      size: 32,
                                                    )),
                                                const SizedBox(width: 40,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              );
            }
            return Container();
          }
      ),
    );
  }

}