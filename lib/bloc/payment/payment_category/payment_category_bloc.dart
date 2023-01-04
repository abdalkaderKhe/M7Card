import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/model/payment_category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'payment_category_event.dart';
part 'payment_category_state.dart';

class PaymentCategoryBloc extends Bloc<PaymentCategoryEvent, PaymentCategoryState> {
  PaymentCategoryBloc() : super(PaymentCategoryInitial()) {
    on<GetPaymentCategory>(getPaymentCategory);
  }
}

getPaymentCategory(GetPaymentCategory event, Emitter<PaymentCategoryState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetPaymentCategoryWaiting());

  try {
    List<PaymentCategory> data = await apiProvider.getAllPaymentCategory(url: ALL_PAYMENT_CATEGORY);
    emit(GetPaymentCategorySuccess(paymentCategoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel')
    {
      emit(GetPaymentCategoryError(errorMessage: ex.toString()));
    }
  }

}