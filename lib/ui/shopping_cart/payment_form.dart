import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:m7card/bloc/payment/order_payment/order_payment_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/product_by_category.dart';
class PaymentForm extends StatefulWidget {
  ProductByCategory productByCategory;
  PaymentForm({Key? key,required this.productByCategory}) : super(key: key);
  @override
  State<PaymentForm> createState() => _PaymentFormState();
}
class _PaymentFormState extends State<PaymentForm> {

  final _amountController = TextEditingController();
  final _playerNameController = TextEditingController();
  final _playerIdController = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  bool isLoading = true;

  bool game = false;
  bool isGame = false;
  int amount = 0;
  int total = 0;

  String contatnt = "";

  _checkGameAndIsGame()
  {
    if(widget.productByCategory.isGame != null)
      {
        isGame = true;
      }
    if(widget.productByCategory.game.toString().isNotEmpty)
      {
        game = true;
      }
  }

  Future<void> api(String id , String product)async{
    print("api");
    var request = http.Request('GET', Uri.parse('http://match.m7-system.com/?key=KZXeXmqtfLRRQuCmMe5c4CnmCrEjSfeZeqd1NxIF2lg&id=${id}&product=${product}'));
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
         String result = await response.stream.bytesToString();
         var body = jsonDecode(result);
         print(body["error"]);
    }
    else {
      throw Exception(response.reasonPhrase);
    }

  }


  @override
  void initState() {
    _checkGameAndIsGame();
    super.initState();
  }

  @override
  void dispose() {
     super.dispose();
    _amountController.dispose();
    _playerIdController.dispose();
    _playerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        automaticallyImplyLeading : false,
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0.5,
      ),

      body: SingleChildScrollView(
        child: BlocListener<OrderPaymentBloc,OrderPaymentState>(
          listener: (BuildContext context,state){
            if(state is PostOrderPaymentLoadingState) {
              "PostOrderPaymentLoadingState";
            }
            if(state is PostOrderPaymentSuccessState) {
              print("PostOrderPaymentSuccessState");
            }
            if(state is PostOrderPaymentErrorState) {
              print("PostOrderPaymentErrorState");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child:Form(
              key: _keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [

                  //Image.network
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width:  MediaQuery.of(context).size.width * 1,
                    child: Image.network(widget.productByCategory.image,fit: BoxFit.cover,),
                  ),

                  const SizedBox(height: 10,),

                  //العدد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: SizedBox(
                              height: 50,width: 30,
                              child:  InkWell(
                                onTap: (){
                                  amount++;
                                  total = widget.productByCategory.price * amount;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                    backgroundColor : const Color.fromRGBO(229, 232, 239, 1),
                                    child: Icon(Icons.add,color: Colors.grey.shade600,),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            controller: _amountController,
                            textAlign:TextAlign.start ,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            textDirection: ui.TextDirection.rtl,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                              filled: true,
                              hintText: amount.toString(),
                              hintTextDirection: ui.TextDirection.rtl,
                              //suffixIcon:const Icon(Icons.key),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  color: Color.fromRGBO(73, 70, 97, 1),
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                          const SizedBox(width: 4,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: SizedBox(
                              height: 50,width: 30,
                              child:  InkWell(
                                onTap: ()
                                {
                                  amount--;
                                  total = widget.productByCategory.price * amount;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                    backgroundColor : const Color.fromRGBO(229, 232, 239, 1),
                                    child: Icon(Icons.remove,color: Colors.grey.shade600,)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                textAlign : TextAlign.start,
                                "العدد",
                                style: TextStyle(
                                    height: 1.8,
                                    fontFamily: "Almarai",
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Icon(Icons.shopping_cart_rounded,color: Colors.grey.shade700,),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //السعر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(widget.productByCategory.price.toString(),style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              textAlign : TextAlign.start,
                              "السعر",
                              style: TextStyle(
                                  height: 1.8,
                                  fontFamily: "Almarai",
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.monetization_on,color: Colors.grey.shade700,),

                        ],
                      ),
                    ],
                  ),

                  Divider(height: 50,color: Colors.grey.shade500,),

                  //المجموع
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(total.toString(),style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              textAlign : TextAlign.start,
                              "المجموع",
                              style: TextStyle(
                                  height: 1.8,
                                  fontFamily: "Almarai",
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Icon(Icons.call_to_action_rounded,color: Colors.grey.shade700,),

                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  //search
                  Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        //"رقم اللاعب"
                        SizedBox(

                          child: TextFormField(
                            readOnly: false,
                            controller: _playerIdController,
                            textAlign:TextAlign.start ,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            textDirection: ui.TextDirection.rtl,
                            textCapitalization: TextCapitalization.sentences,

                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                              filled: true,
                              hintText: "رقم اللاعب",
                              hintStyle: const TextStyle(fontSize: 14),
                              hintTextDirection: ui.TextDirection.rtl,
                              //suffixIcon:const Icon(Icons.key),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  color: Color.fromRGBO(73, 70, 97, 1),
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 5,),
                        //search
                        isLoading ?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor : const Color.fromRGBO(229, 232, 239, 1),
                              child: Center(child: IconButton(
                                onPressed: () async{
                                   setState(() {isLoading =false;});
                                   await api("5487886325145","pubg").whenComplete((){
                                     setState(() {
                                        isLoading =true;
                                       _showMyDialog();
                                     });
                                   });
                                },
                                icon: const Icon(Icons.search,size: 30,),color: Colors.blue,)),
                            ),
                          ),
                        )
                            :
                        const SizedBox(height: 50,width: 100,child: Center(child: CircularProgressIndicator(color: BLACK_GREY,),),),

                        const SizedBox(height: 20,),
                        //"اسم اللاعب"
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 1,
                          child: TextFormField(
                            readOnly: true,
                            controller: _playerNameController,
                            textAlign:TextAlign.start ,
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            textDirection: ui.TextDirection.rtl,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              fillColor: const  Color.fromRGBO(229, 232, 239, 1),
                              filled: true,
                              hintText: "اسم اللاعب",
                              hintTextDirection: ui.TextDirection.rtl,
                              //suffixIcon:const Icon(Icons.key),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(
                                  color: Color.fromRGBO(73, 70, 97, 1),
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  //شراء
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape:const StadiumBorder(),
                        primary:const  Color.fromRGBO(155, 149, 239, 1),
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Icon(Icons.arrow_back,color: Colors.white,),
                          Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 17,fontWeight: FontWeight.w900),)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تنبيه'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('المستخدم غير موجود'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('اغلاق'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}

