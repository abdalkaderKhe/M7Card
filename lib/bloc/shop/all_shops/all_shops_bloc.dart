import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/shop.dart';
import 'package:m7card/network/api_provider.dart';

part 'all_shops_event.dart';
part 'all_shops_state.dart';

class AllShopsBloc extends Bloc<AllShopsEvent, AllShopsState> {
  AllShopsBloc() : super(AllShopsInitial()) {
    on<GetAllShops>(_getAllShops);
  }
}

void _getAllShops(AllShopsEvent event, Emitter<AllShopsState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(ShopWaiting());
  try {
    List<Shop> data = await apiProvider.getAllShop(ALL_SHOP);
    emit(GetAllShopsSuccess(shopData:data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(ShopError(errorMessage: ex.toString()));
    }
  }

}

