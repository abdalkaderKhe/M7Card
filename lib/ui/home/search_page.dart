import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/account/user_profile/user_profile_bloc.dart';
import 'package:m7card/bloc/category/all_category/all_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/model/user_profile.dart';
import 'package:m7card/ui/home/economize_page.dart';
import 'package:m7card/ui/widgets/category_card_item.dart';
import 'package:m7card/ui/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/backgroud_color.dart';
import 'category_page.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {

  //AllCategory
  List<CategoryModel> categoryData = [];
  late AllCategoryBloc _allCategoryBloc;
  bool _lastDataAllCategory = false;

  List<CategoryModel> searchedForCategories = [];
  bool isSearching = false;
  final _searchTextController = TextEditingController();

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
    print("=======_token======");
    print(_token);
    return _token;
  }


  @override
  void initState() {
    super.initState();
    _checkIsLogin();
    _allCategoryBloc = BlocProvider.of<AllCategoryBloc>(context);
    _allCategoryBloc.add(GetAllCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundColor(),
        Scaffold(
          backgroundColor :Colors.transparent,
          extendBodyBehindAppBar: false,
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
            title:const Text("البحث",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17,fontWeight: FontWeight.w900),),
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
              listeners: [
                BlocListener<AllCategoryBloc, AllCategoryState>(
                  listener: (BuildContext context, state) {
                    if (state is CategoryError) {
                      "_globalFunction.showToast(type: 'error', message: state.errorMessage)";
                    }
                    if (state is GetCategorySuccess) {
                      if (state.categoryData.length == 0) {
                        _lastDataAllCategory = true;
                      } else {
                        categoryData.addAll(state.categoryData);
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  const Padding(padding: EdgeInsets.only(top: 20,right: 8,bottom: 20),

                  child:Text("ما الذي تريد البحث عنه",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 17),)),

                  // search  TextFormField
                  _buildSearchField(context),

                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: BlocBuilder<AllCategoryBloc, AllCategoryState>(
                           builder: (BuildContext context, state){
                             if(state is CategoryError)
                             {
                               return const SizedBox(
                                   child:  Center(
                                       child: Text(ERROR_OCCURED, style: TextStyle(
                                           fontSize: 14,
                                           color: BLACK_GREY,
                                       ))
                                   )
                               );
                             }
                             else
                             {
                               if(_lastDataAllCategory)
                               {
                                 return Wrap();
                               }
                               else
                               {
                                 if(categoryData.length==0){
                                    return const Padding(
                                     padding:EdgeInsets.only(top: 200),
                                     child:  Center(child: CircularProgressIndicator(color:Color.fromRGBO(206, 223, 253, 1),)),
                                   );
                                 }
                                 else
                                 {
                                   return  isSearching ?  _buildBody(context, categoryModelList: searchedForCategories) :  _buildBody(context, categoryModelList: categoryData);
                                 }
                               }
                             }
                           },
                           //child: _buildBody(context),
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
  Widget _buildBody(BuildContext context, {required List<CategoryModel> categoryModelList})
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

  Widget _buildSearchField(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: TextFormField(
        controller: _searchTextController,
        textAlign:TextAlign.start,
        textDirection: TextDirection.rtl,
        onChanged: (searchedCategory){
           _searchTextController.text.isNotEmpty ? isSearching = true : isSearching = false;
           _addSearchedForItemToSearchedList(searchedCategory);
           setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor:const Color.fromRGBO(229, 232, 239, 1),
          filled: true,
          hintText: "أكتب الذي تريد البحث عنه..",
          hintStyle: const TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(181, 180, 240, 1),fontSize: 14,),
          hintTextDirection: TextDirection.rtl,
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(73, 70, 97, 1),
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  void _addSearchedForItemToSearchedList(String searchedCategory)
  {
    searchedForCategories = categoryData.where((category) => category.title.toLowerCase().startsWith(searchedCategory)).toList();
    setState(() {});
  }

}













/*
Widget _cardItem(BuildContext context, String title,String imageUrl){
    return InkWell(
      onTap: (){
        //CategoryPage
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CategoryPage(),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 80,width: 120,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Image.network(imageUrl),
            ),
          ),
           const SizedBox(height: 3,),
           Text(title,textAlign: TextAlign.center,style:const TextStyle(
               fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 12,

           ),),
        ],
      ),
    );
  }
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
                        ],
                      ),
                    ),
                  ],
                ),
                  */
 */
