import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/payment/order_payment/order_payment_bloc.dart';
import '../home/economize_page.dart';

class AddCreditForm extends StatefulWidget {
  String payment_way_id;
  AddCreditForm({Key? key , required this.payment_way_id}) : super(key: key);
  @override
  State<AddCreditForm> createState() => _AddCreditFormState();
}

class _AddCreditFormState extends State<AddCreditForm> {


   final  TextEditingController _amountEditingController = TextEditingController();

   final  TextEditingController _balanceValueEditingController = TextEditingController();

   final  TextEditingController _dateTimeEditingController = TextEditingController();

   final  TextEditingController _noteEditingController = TextEditingController();

   final  TextEditingController _acc_NameEditingController = TextEditingController();

   final _keyForm = GlobalKey<FormState>();

   late OrderPaymentBloc _orderPaymentBloc;
   bool _lastDataOrderPaymentBloc = false;


   @override
  void initState() {
     _orderPaymentBloc = BlocProvider.of<OrderPaymentBloc>(context);
     super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        automaticallyImplyLeading:false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 25,
              ),
              color: Color.fromRGBO(133, 116, 231, 1)),
        ],

        title: Text(
          "اضافة رصيد",
          style: TextStyle(
              fontFamily: "Almarai",
              color: Color.fromRGBO(73, 70, 97, 1),
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 25),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Container(height: 1.5,width: double.infinity,color: Colors.grey.shade400,),
                SizedBox(height: height / 35,),
                Text(
                  "المبلغ",style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                ),
                SizedBox(height: height / 50,),
                SizedBox(
                  height: height / 20,
                  width: width / 1,
                  child: TextFormField(
                    controller: _amountEditingController,
                    textAlign:TextAlign.start ,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      //hintText: "المبلغ",
                      hintTextDirection: TextDirection.rtl,
                      //suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),


                Text(
                  "الاسم",style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                ),
                SizedBox(height: height / 50,),
                SizedBox(
                  height: height / 20,
                  width: width / 1,
                  child: TextFormField(
                    controller: _acc_NameEditingController,
                    validator: (text)
                    {
                      if(text!.isEmpty)
                      {
                        return "يجب ادخال الاسم";
                      }
                    },
                    textAlign:TextAlign.start ,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      //hintText: "المبلغ",
                      hintTextDirection: TextDirection.rtl,
                      //suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height / 50,),


                Text(
                  "المبلغ المضاف",style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),),

                SizedBox(height: height / 50,),
                SizedBox(
                  height: height / 20,
                  width: width / 1,
                  child: TextFormField(
                    controller: _balanceValueEditingController,
                    validator: (text)
                    {
                      if(text!.isEmpty)
                      {
                        return "يجب المبلغ المضاف";
                      }
                    },
                    textAlign:TextAlign.start ,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.all(10),
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      //hintText: "المبلغ",
                      hintTextDirection: TextDirection.rtl,
                      //suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                Text(
                  "التاريخ",style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                ),

                SizedBox(height: height / 50,),
                SizedBox(
                  height: height / 20,
                  width: width / 1,
                  child: TextFormField(
                    controller: _dateTimeEditingController,
                    textAlign:TextAlign.start ,
                    validator: (text)
                    {
                      if(text!.isEmpty)
                      {
                        return "يجب تحديد التاريخ";
                      }
                    },
                    keyboardType: TextInputType.datetime,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      hintText: "mm/dd/yyyy",
                      hintTextDirection: TextDirection.rtl,
                      //suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                Text(
                  "ملاحظات",style: TextStyle(
                    fontFamily: "Almarai",
                    color: Color.fromRGBO(73, 70, 97, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w900),),
                SizedBox(height: height / 50,),
                SizedBox(
                  height: height / 5,
                  width: width / 1,
                  child: TextFormField(
                    maxLines: 15,
                    controller: _noteEditingController,
                    textAlign:TextAlign.start,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor:const Color.fromRGBO(229, 232, 239, 1),
                      filled: true,
                      hintTextDirection: TextDirection.rtl,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Color.fromRGBO(73, 70, 97, 1),
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height / 50,),

                /*
                                                        if (_keyForm.currentState!.validate()) {
                                          loginButtonPress = true;
                                          _loginBloc.add(
                                            LoginButtonPressEvent(
                                              email: _emailEditingController.text,
                                              password: _passwordEditingController.text,
                                              token: '',
                                            ),
                                          );
                                        }
                 */


                BlocListener<OrderPaymentBloc,OrderPaymentState>(
                    listener:  (BuildContext context, state)
                    {
                      if(state is PostOrderPaymentLoadingState)
                        {
                          showProgressIndicator(context);
                        }
                      if(state is PostOrderPaymentSuccessState)
                        {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => EconomizePage()),
                          );
                        }
                      if(state is PostOrderPaymentErrorState)
                       {
                        Navigator.pop(context);
                        String errorMsg = state.message;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg) ,
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 4),));
                      }
                    },
                  child: SizedBox(),
                ),

                GestureDetector(
                  onTap: ()
                  {
                    if (_keyForm.currentState!.validate()) {
                      _orderPaymentBloc.add(
                        // todo add user id
                        SubmitButtonPressEvent(
                            accName: _acc_NameEditingController.text,
                            payment_way_id: widget.payment_way_id,
                            amount: _amountEditingController.text,
                            balanceValue: _balanceValueEditingController.text,
                            date: _dateTimeEditingController.text,
                            note: _noteEditingController.text,
                        ),
                      );
                    }
                  },
                  child:  Container(
                    height: height / 18,
                    width: width / 1,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(133, 116, 231, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'ارسال',
                        style:TextStyle(
                            fontFamily: "Almarai",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                    )
                ),
                ),

              ],
            ),
          )
        ),
      )
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
}
