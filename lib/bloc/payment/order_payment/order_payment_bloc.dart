import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'order_payment_event.dart';
part 'order_payment_state.dart';

class OrderPaymentBloc extends Bloc<OrderPaymentEvent, OrderPaymentState> {
  OrderPaymentBloc() : super(OrderPaymentInitial()) {
    on<SubmitButtonPressEvent>(_postOrderPayment);
  }
}

_postOrderPayment(OrderPaymentEvent event, Emitter<OrderPaymentState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(PostOrderPaymentLoadingState());

  if (event is SubmitButtonPressEvent){
    var resulte =  await apiProvider.postOrderPayment(
      url: "https://m7card.manarhays.com/api/v100/register",
      body:{
        "acc_name" : event.accName,
        "user_id": "1",
        "amount": event.amount,
        "balance_value": event.balanceValue,
        "date": event.date,
        "note": event.note,
      },

    );
    if(resulte["success"].toString() == "true"){
      emit(PostOrderPaymentSuccessState());
    }else if(resulte["success"].toString() == "false"){
      emit(PostOrderPaymentErrorState(message: ''));
    }
  }


}
