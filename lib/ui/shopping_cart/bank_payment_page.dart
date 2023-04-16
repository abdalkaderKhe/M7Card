import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m7card/bloc/payment/payment_by_category/payment_by_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/payment_by_category.dart';
import 'package:m7card/ui/shopping_cart/payment_form.dart';

import 'add_credit_form.dart';
import 'add_credit_payment_form.dart';
class BankPaymentPage extends StatefulWidget {
  int id;
  BankPaymentPage({Key? key, required this.id}) : super(key: key);
  @override
  State<BankPaymentPage> createState() => _BankPaymentPageState();
}

class _BankPaymentPageState extends State<BankPaymentPage> {
  List<String> bank_names = [
    "كويت ترك",
    "الزراعات",
  ];
  List<String> images = [
    "https://turkeylife.news/wp-content/uploads/2017/08/%D9%83%D9%88%D9%8A%D8%AA-%D8%AA%D8%B1%D9%83.png",
    "https://tijaratuna.com/wp-content/uploads/2022/06/%D8%B2%D8%B1%D8%A7%D8%B9%D8%A7%D8%AA-%D8%A8%D9%86%D9%83.jpg",
  ];

  List<PaymentByCategory> paymentByCategoryData = [];
  late PaymentByCategoryBloc _paymentByCategoryBloc;

  @override
  void initState() {
     print(widget.id);
    _paymentByCategoryBloc = BlocProvider.of<PaymentByCategoryBloc>(context);
    _paymentByCategoryBloc.add(GetPaymentByCategory(paymentCategoryID: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<PaymentByCategoryBloc, PaymentByCategoryState>(
      listener:(BuildContext context, state) {
        if(state is GetPaymentByCategoryInitial){
          print("GetPaymentByCategoryInitial");
        }
        if(state is GetPaymentByCategoryWaiting){
          print("GetPaymentCategoryWaiting");
        }
        if(state is GetPaymentByCategoryError){
          print("GetPaymentCategoryError");
        }
        if(state is GetPaymentByCategorySuccess){
          print("GetPaymentCategorySuccess");
        }
      },
      child: Scaffold(
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
            "البنوك",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              const SizedBox(height: 20,),

              BlocBuilder<PaymentByCategoryBloc, PaymentByCategoryState>(
                builder: (BuildContext context,state){
                  if(state is GetPaymentByCategoryWaiting){
                    return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(241, 232, 251, 1),),);
                  }
                  if(state is GetPaymentByCategoryError){
                    return const SizedBox(
                        child:Center(
                            child: Text(ERROR_OCCURED, style: TextStyle(
                              fontSize: 14,
                              color: BLACK_GREY,
                            ))
                        )
                    );
                  }
                  if(state is GetPaymentByCategorySuccess){
                    return Directionality(
                        textDirection: TextDirection.rtl,
                        child: CustomScrollView(
                      shrinkWrap: true,
                      primary: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding:const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          sliver: SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.85,
                            ),
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return buildCardGrid(
                                  context,
                                  state.paymentByCategoryData[index].name,
                                  images[0],
                                  state.paymentByCategoryData[index].id.toString(),
                                );
                              },
                              childCount: state.paymentByCategoryData.length,
                            ),
                          ),
                        ),
                      ],
                    ));
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardGrid(context, name ,imageUrl , String bankId){
    final double boxImageSize = ((MediaQuery.of(context).size.width)-50)/2-20;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddCreditForm(payment_way_id: bankId,),
                      ),
                    );
                  },
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    width: boxImageSize,
                    height: boxImageSize,
                  ),
                )
            ),
            Container(
              margin:const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontFamily: "Almarai",color:Color(0xFF515151),fontSize: 13,), maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
