import 'package:flutter/material.dart';
import 'package:m7card/ui/shopping_cart/payment_page.dart';
class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          elevation: 0,
          automaticallyImplyLeading:false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 30,
                ),
                color: Color.fromRGBO(133, 116, 231, 1)),
          ],
          title: const Padding(
            padding: EdgeInsets.only(left: 260),
            child: Text(
              "السلة",
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: Color.fromRGBO(73, 70, 97, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: const Color.fromRGBO(246, 246, 246, 1),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12),
                        height: 200,
                        width: double.infinity,
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    const Text(
                                      "75 ريال",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    // المتجر السعودي flag
                                    Row(
                                      children: [
                                        // المتجر السعودي
                                        const Text(
                                          "المتجر السعودي",
                                          style: TextStyle(
                                              fontFamily: "Almarai",
                                              color: Color.fromRGBO(
                                                  170, 170, 180, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        // falg
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: CircleAvatar(
                                            radius: 10,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // + 1 -
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete,
                                                size: 17,
                                                color: Color.fromRGBO(
                                                    73, 70, 97, 1))),
                                        Container(
                                          height: 30,
                                          //padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                225, 225, 235, 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 17,
                                                    )),
                                                const Text(
                                                  "1",
                                                  style: TextStyle(
                                                    fontFamily: "Almarai",
                                                    color: Color.fromRGBO(
                                                        73, 70, 97, 1),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.remove,
                                                        size: 17)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  width: 15,
                                ),

                                //"assets/images/logo.png"
                                SizedBox(
                                  width: 140,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            //  سعر البطاقة 19.25  نقاط دليل ستارز لكل بطاقة 38 *
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ": M7 Card نقاط دليل لكل بطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 160, top: 5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            const Text(
                                              "38",
                                              style: TextStyle(
                                                  fontFamily: "Almarai",
                                                  color: Color.fromRGBO(
                                                      73, 70, 97, 1),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      ": سعر البطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: const Text(
                                        "\$19.95",
                                        style: TextStyle(
                                            fontFamily: "Almarai",
                                            color:
                                                Color.fromRGBO(73, 70, 97, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(12),
                        height: 200,
                        width: double.infinity,
                        color: const Color.fromRGBO(236, 237, 241, 1),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    const Text(
                                      "75 ريال",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    // المتجر السعودي flag
                                    Row(
                                      children: [
                                        // المتجر السعودي
                                        const Text(
                                          "المتجر السعودي",
                                          style: TextStyle(
                                              fontFamily: "Almarai",
                                              color: Color.fromRGBO(
                                                  170, 170, 180, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        // falg
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: CircleAvatar(
                                            radius: 10,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // + 1 -
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete,
                                                size: 17,
                                                color: Color.fromRGBO(
                                                    73, 70, 97, 1))),
                                        Container(
                                          height: 30,
                                          //padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                225, 225, 235, 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 17,
                                                    )),
                                                const Text(
                                                  "1",
                                                  style: TextStyle(
                                                    fontFamily: "Almarai",
                                                    color: Color.fromRGBO(
                                                        73, 70, 97, 1),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.remove,
                                                        size: 17)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  width: 15,
                                ),

                                //"assets/images/logo.png"
                                SizedBox(
                                  width: 140,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //  سعر البطاقة 19.25  نقاط دليل ستارز لكل بطاقة 38 *
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ": M7 Card نقاط دليل لكل بطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 160, top: 5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            const Text(
                                              "38",
                                              style: TextStyle(
                                                  fontFamily: "Almarai",
                                                  color: Color.fromRGBO(
                                                      73, 70, 97, 1),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      ": سعر البطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: const Text(
                                        "\$19.95",
                                        style: TextStyle(
                                            fontFamily: "Almarai",
                                            color:
                                                Color.fromRGBO(73, 70, 97, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(12),
                        height: 200,
                        width: double.infinity,
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    const Text(
                                      "75 ريال",
                                      style: TextStyle(
                                          fontFamily: "Almarai",
                                          color: Color.fromRGBO(73, 70, 97, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    // المتجر السعودي flag
                                    Row(
                                      children: [
                                        // المتجر السعودي
                                        const Text(
                                          "المتجر السعودي",
                                          style: TextStyle(
                                              fontFamily: "Almarai",
                                              color: Color.fromRGBO(
                                                  170, 170, 180, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        // falg
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: CircleAvatar(
                                            radius: 10,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // + 1 -
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete,
                                                size: 17,
                                                color: Color.fromRGBO(
                                                    73, 70, 97, 1))),
                                        Container(
                                          height: 30,
                                          //padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                225, 225, 235, 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 17,
                                                    )),
                                                const Text(
                                                  "1",
                                                  style: TextStyle(
                                                    fontFamily: "Almarai",
                                                    color: Color.fromRGBO(
                                                        73, 70, 97, 1),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.remove,
                                                        size: 17)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  width: 15,
                                ),

                                //"assets/images/logo.png"
                                SizedBox(
                                  width: 140,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            //  سعر البطاقة 19.25  نقاط دليل ستارز لكل بطاقة 38 *
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ": M7 Card نقاط دليل لكل بطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 160, top: 5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            const Text(
                                              "38",
                                              style: TextStyle(
                                                  fontFamily: "Almarai",
                                                  color: Color.fromRGBO(
                                                      73, 70, 97, 1),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      ": سعر البطاقة",
                                      style: TextStyle(
                                        fontFamily: "Almarai",
                                        color: Color.fromRGBO(170, 170, 180, 1),
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: const Text(
                                        "\$19.95",
                                        style: TextStyle(
                                            fontFamily: "Almarai",
                                            color:
                                                Color.fromRGBO(73, 70, 97, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "\$25.56",
                            style: TextStyle(
                              fontFamily: "Almarai",
                              color: Color.fromRGBO(170, 170, 180, 1),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            ":  اجمالي السلة",
                            style: TextStyle(
                              fontFamily: "Almarai",
                              color: Color.fromRGBO(170, 170, 180, 1),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "\$0.08",
                            style: TextStyle(
                              fontFamily: "Almarai",
                              color: Color.fromRGBO(170, 170, 180, 1),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            ":   ضريبة القيمة المضافة",
                            style: TextStyle(
                              fontFamily: "Almarai",
                              color: Color.fromRGBO(170, 170, 180, 1),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              side: BorderSide(color: Colors.grey, width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "استلمها الآن",
                                  style: TextStyle(
                                      fontFamily: "Almarai",
                                      color: Color.fromRGBO(73, 70, 97, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Color.fromRGBO(229, 232, 239, 1),
                            side: BorderSide(color: Colors.grey, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "أرسلها كهدية",
                                style: TextStyle(
                                    fontFamily: "Almarai",
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 651),
              child: Container(
                height: 80,
                width: double.infinity,
                color: const Color.fromRGBO(133, 116, 231, 1),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0,left: 8,right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.green,
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PaymentCategoryPage(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const [
                              Icon(Icons.arrow_back,color: Colors.white,),
                              const SizedBox(width: 9,),
                              Text("الانتقال للدفع",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                      const  Text("\$ الاجمالي : 25.24   ",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             fontFamily: "Almarai",
                             color: Colors.white,fontSize: 17,
                             fontWeight: FontWeight.w900),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
