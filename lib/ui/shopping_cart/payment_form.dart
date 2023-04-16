import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:m7card/bloc/payment/order_payment/order_payment_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/product_by_category.dart';
import 'package:m7card/model/directPay.dart';

import '../home/bottom_nav_bar.dart';

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

  bool isLoading = false;

  bool game = false;
  bool isGame = false;
  int amount = 1;
  int total = 0;

  String authorisationResult = '';
  String directPayResult = '';

  String contatnt = "";

  _checkGameAndIsGame()
  {
    if(widget.productByCategory.isGame != null || widget.productByCategory.game != null)
      {
       setState(() {
         isLoading = true;
       });
      }
    /*
       if(widget.productByCategory.game != null)
      {
        game = true;
      }
    */
  }

  Future<void> _postAuthorisation(String id , String product)async{
    var request = http.Request('GET', Uri.parse('http://match.m7-system.com/?key=KZXeXmqtfLRRQuCmMe5c4CnmCrEjSfeZeqd1NxIF2lg&id=${id}&product=${product}'));
    http.StreamedResponse response = await request.send();

    print(response.statusCode);

    if (response.statusCode == 200)
    {
      String result = await response.stream.bytesToString();
      var body = jsonDecode(result);
      setState(() {
        authorisationResult = body["result"];
      });
      print(body["result"]);
    }
    else
    {
      print(response.reasonPhrase);
    }

  }

  Future<void> _postDirectPay(DirectPay directPay)async
  {
    showProgressIndicator(context);
    var request = http.MultipartRequest('POST', Uri.parse('https://m7card.manarhays.com/api/v100/directpay'));
    request.fields.addAll({
      'product_id': directPay.productId,
      'quantity': directPay.quantity,
      'user_id': directPay.userId,
      'note': directPay.note,
      'player_id': directPay.productId,
      'player_name': directPay.playerName.toString(),
    });
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200)
    {
      String result = await response.stream.bytesToString();
      var body = jsonDecode(result);
      setState(() {
        directPayResult = body["message"];
        print(directPayResult);//"success!!"
        if(directPayResult == "success!!")
          {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>  BottomNavBar(),
              ),
            );
          }
        else
        {
          Navigator.of(context).pop();
          _showMyDialog("خطأ في رمز التفعيل");
        }
      });
    }
    else
    {
       print(response.reasonPhrase);
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            padding: EdgeInsets.symmetric(horizontal: width / 15 ),
            child:Form(
              key: _keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  //Image.network
                  SizedBox(
                    height: height / 4,
                    width:  width / 1,
                    child: Image.network(widget.productByCategory.image,fit: BoxFit.cover,),
                  ),

                  SizedBox(height: height / 30,),

                  //العدد
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: height / 30),
                            child: SizedBox(
                              height: height / 15 ,
                              width: width / 15,
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
                          SizedBox(width: width / 30,),
                          SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
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
                          SizedBox(width: width / 30,),
                          Padding(
                            padding: EdgeInsets.only(bottom: height / 30),
                            child: SizedBox(
                              height: height / 15 ,
                              width: width / 15,
                              child:  InkWell(
                                onTap: ()
                                {
                                  amount != 1 ? amount-- : amount == 1;
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

                  SizedBox(height: height / 40,),

                  //search
                  Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        //"رقم اللاعب"
                        widget.productByCategory.isGame == null ? const SizedBox() : SizedBox(
                          child: TextFormField(
                            readOnly: widget.productByCategory.isGame == null ? true : false,
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

                        SizedBox(height: height / 40,),

                        //"اسم اللاعب"
                        widget.productByCategory.game == null ?  const SizedBox() : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 1,
                          child: TextFormField(
                            readOnly:true,
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
                              hintText: "",
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

                       //search
                        widget.productByCategory.game == null ?  const SizedBox() : isLoading ?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor : const Color.fromRGBO(229, 232, 239, 1),
                              child: Center(child: IconButton(
                                onPressed: () async
                                {
                                  _playerNameController.text = widget.productByCategory.game.toString();
                                  if(widget.productByCategory.isGame != null || widget.productByCategory.game != null)
                                  {
                                    setState(() {isLoading =false;});
                                    await _postAuthorisation(
                                        _playerIdController.text.toString(),
                                        _playerNameController.text.toString()
                                    ).whenComplete((){
                                      setState(() {
                                         isLoading =true;
                                         if(authorisationResult != "success")
                                           {
                                             _showMyDialog("خطأ في عملية المطابقة");
                                           }

                                      });
                                    });
                                  }
                                },
                                icon: const Icon(Icons.search,size: 30,),color: Colors.blue,)),
                            ),
                          ),
                        )
                        :
                        SizedBox(height: height /10,width: width / 5,child: Center(child: CircularProgressIndicator(color: BLACK_GREY,),),),


                      ],
                    ),
                  ),

                  SizedBox(height: height / 40,),

                  //شراء
                  SizedBox(
                    width: double.infinity,
                    height: height / 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape:const StadiumBorder(),
                        primary:Color.fromRGBO(155, 149, 239,
                            //authorisationResult == "success" ? 1 : 0.2
                          1
                        ),
                      ),
                      onPressed: ()async
                      {
                        final DirectPay directPay = DirectPay(
                          productId: widget.productByCategory.id.toString(),
                          quantity: amount.toString(),
                          userId: '4',
                          note: 'this is note',
                          playerId: _playerIdController.text.isNotEmpty ? _playerIdController.text : null,
                          playerName: _playerNameController.text.isNotEmpty ? _playerNameController.text : null,
                        );
                        await _postDirectPay(directPay);
                       /*
                        if(total == 0)
                        {
                          _showMyDialog("المجموع  يساوي الصفر");
                        }
                        if(total != 0  && authorisationResult == "success")
                          {
                            await _postDirectPay(directPay);
                          }

                        */
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                          Text("شراء",style: TextStyle(fontFamily: "Almarai",color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
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

  void showProgressIndicator(BuildContext context)
  {
    AlertDialog alertDialog =  AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),),),
    );
    showDialog(
      context: context,
      builder: (context){return alertDialog;},
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
    );
  }

  Future<void> _showMyDialog(String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تنبيه'),
          content: SingleChildScrollView(
            child: ListBody(
              children:<Widget>[
                Text(content),
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

