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
      amount: event.amount,
      balanceValue: event.balanceValue,
      note: event.note,
      name: event.accName,
      payment_way_id: event.payment_way_id,
      dateTime: event.date,
    );

    if(resulte["success"].toString() == "true")
    {
      emit(PostOrderPaymentSuccessState());
    }
    else if(resulte["success"].toString() == "false")
    {
      emit(PostOrderPaymentErrorState(message: ''));
    }
  }


}
