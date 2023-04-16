import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/model/order.dart';
import 'package:meta/meta.dart';

import '../../network/api_provider.dart';

part 'user_orders_event.dart';
part 'user_orders_state.dart';

class UserOrdersBloc extends Bloc<UserOrdersEvent, UserOrdersState> {
  UserOrdersBloc() : super(UserOrdersInitial()) {
    on<GetOrdersDate>(_getServicesCategories);
  }
}

void _getServicesCategories(UserOrdersEvent event, Emitter<UserOrdersState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(GetUserOrdersWaiting());

  try {
    List<Order> data = await apiProvider.getUserOrder();
    emit(GetUserOrdersSuccess(orderData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetUserOrdersError(errorMessage: ex.toString()));
    }
  }


}
