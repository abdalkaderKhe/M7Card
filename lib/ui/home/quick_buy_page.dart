import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class QuickBuy extends StatefulWidget {
  const QuickBuy({Key? key}) : super(key: key);
  @override
  State<QuickBuy> createState() => _QuickBuyState();
}

class _QuickBuyState extends State<QuickBuy> {

  @override
  void initState() {
    super.initState();
    _modalBottomSheetMenu();
  }

 // static const IconData list = IconData(0xe384, fontFamily: 'MaterialIcons', matchTextDirection: true);
 // List<IconData> _icons = [Icons.grid_view_outlined,FontAwesomeIcons.gamepad,Icons.wifi,Icons.shopping_basket,(Icons.density_small_sharp),];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(82, 81, 112, 1),
     // color: Colors.white,
    );
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          context: context,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (builder) {
            return GestureDetector(
              child: Container(
                height: 600,
                color: Colors.transparent,
                padding: EdgeInsets.all(20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("الشراء السريع",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13,fontWeight:FontWeight.w900),),
                        SizedBox(width: 10,),
                        Icon(Icons.bolt,color: Colors.amber,size: 30,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 70,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: 7,
                                      itemBuilder: (BuildContext context, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 1),radius: 28,child: Icon(Icons.wifi,size: 35,) ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("التصنيف",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                                ),
                                Text("اختيار",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 70,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: 7,
                                      itemBuilder: (BuildContext context, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 0.5),radius: 28 ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("التصنيف",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                                ),
                                Text("اختيار",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 70,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: 7,
                                      itemBuilder: (BuildContext context, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 0.5),radius: 28 ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("التصنيف",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                                ),
                                Text("اختيار",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 70,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: 7,
                                      itemBuilder: (BuildContext context, int index) {
                                        return const Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child:  CircleAvatar(backgroundColor: Color.fromRGBO(229, 232, 239, 0.5),radius: 28 ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("التصنيف",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                                ),
                                Text("اختيار",style: TextStyle(fontFamily: "Almarai",color: Color.fromRGBO(73, 70, 97, 1),fontSize: 13),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Center(
                      child: FloatingActionButton(
                        onPressed: (){},
                        child: CircleAvatar(backgroundColor: Colors.amber,radius: 28,child: Icon(Icons.add,size: 35,color: Colors.white,) ),
                      ),
                    ),

                    // SizedBox(height: 50,),
                  ],
                ),
              ),
            );
          });
    });
  }

}
