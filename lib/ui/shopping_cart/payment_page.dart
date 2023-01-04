import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m7card/bloc/payment/payment_category/payment_category_bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/payment_category.dart';

import 'bank_payment_page.dart';
class PaymentCategoryPage extends StatefulWidget {
  const PaymentCategoryPage({Key? key}) : super(key: key);
  @override
  State<PaymentCategoryPage> createState() => _PaymentCategoryPageState();
}
class _PaymentCategoryPageState extends State<PaymentCategoryPage> {

  List<String> categories = [
    "حوالات بنكية",
    "ايداع عبر المكاتب",
    "حوالات مالية",
  ];
  List<IconData> icons = [
    FontAwesomeIcons.landmark,
    FontAwesomeIcons.sackDollar,
    FontAwesomeIcons.moneyBillTransfer,
  ];

  List<PaymentCategory> paymentCategoryData = [];
  late PaymentCategoryBloc _paymentCategoryBloc;

  @override
  void initState() {
    super.initState();
    _paymentCategoryBloc = BlocProvider.of<PaymentCategoryBloc>(context);
    _paymentCategoryBloc.add(GetPaymentCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
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
            "الدفع",
            style: TextStyle(
                fontFamily: "Almarai",
                color: Color.fromRGBO(73, 70, 97, 1),
                fontSize: 17,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: BlocListener<PaymentCategoryBloc, PaymentCategoryState>(
        listener: (BuildContext context, state) {
          if(state is GetPaymentCategoryWaiting){
            print("GetPaymentCategoryWaiting");
          }
          if(state is GetPaymentCategoryError){
            print("GetPaymentCategoryError");
          }
          if(state is GetPaymentCategorySuccess){
            print("GetPaymentCategorySuccess");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 200),
                child: Text(
                  // textAlign : TextAlign.left,
                  "يرجى اختيار طرق الدفع",
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: "Almarai",
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              BlocBuilder<PaymentCategoryBloc, PaymentCategoryState>(
                builder: (BuildContext context, state){
                  if(state is GetPaymentCategoryWaiting){
                    return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(241, 232, 251, 1),),);
                  }
                  if(state is GetPaymentCategoryWaiting){
                    return const SizedBox(
                        child:Center(
                            child: Text(ERROR_OCCURED, style: TextStyle(
                              fontSize: 14,
                              color: BLACK_GREY,
                            ))
                        )
                    );
                  }
                  if(state is GetPaymentCategorySuccess){
                    return CustomScrollView(
                      shrinkWrap: true,
                      primary: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          sliver: SliverGrid(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 0.73,
                            ),
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return buildCardGrid(context, state.paymentCategoryData[index].name, "assets/images/bank.jpg", icons[index],state.paymentCategoryData[index].id);
                              },
                              childCount: state.paymentCategoryData.length,
                            ),
                          ),
                        ),
                      ],
                    );
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
  Widget buildCardGrid(context, name, imageUrl, IconData,id) {
    final double boxImageSize =
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Container(
      child: Card(
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: boxImageSize,
                        height: boxImageSize,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  BankPaymentPage(id: id,),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Card(
                            color: Colors.indigo,
                            child: Icon(
                              IconData,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: "Almarai",
                        color: Color(0xFF515151),
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 return  CustomScrollView(
                    shrinkWrap: true,
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        sliver: SliverGrid(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.73,
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return buildCardGrid(context, categories[index], "assets/images/bank.jpg", icons[index]);
                            },
                            childCount: 3,
                          ),
                        ),
                      ),
                    ],
                  );
 */