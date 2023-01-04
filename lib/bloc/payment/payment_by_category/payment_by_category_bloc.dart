import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/payment_by_category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'payment_by_category_event.dart';
part 'payment_by_category_state.dart';

class PaymentByCategoryBloc extends Bloc<PaymentByCategoryEvent, PaymentByCategoryState> {
  PaymentByCategoryBloc() : super(GetPaymentByCategoryInitial()) {
    on<GetPaymentByCategory>(getPaymentByCategory);
  }
}

getPaymentByCategory(GetPaymentByCategory event, Emitter<PaymentByCategoryState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetPaymentByCategoryWaiting());
  int id = event.paymentCategoryID;

  try {
    print("==========================");
    List<PaymentByCategory> data = await apiProvider.getPaymentByCategory(url: PAYMENT_BY_CATEGORY, id: id.toString());
    emit(GetPaymentByCategorySuccess(paymentByCategoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel')
    {
      emit(GetPaymentByCategoryError(errorMessage: ex.toString()));
    }
  }

}
