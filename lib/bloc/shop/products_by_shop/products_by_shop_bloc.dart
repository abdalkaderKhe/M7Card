import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/product_by_shop.dart';
import '../../../model/product_by_shop_model.dart';
import '../../../network/api_provider.dart';
import '../../category/products_by_category/products_by_category_bloc.dart';

part 'products_by_shop_event.dart';
part 'products_by_shop_state.dart';

class ProductsByShopBloc extends Bloc<ProductsByShopEvent, ProductsByShopState> {
  ProductsByShopBloc() : super(ProductsByShopInitial()) {
    on<GetProductsByShop>(_getProductsByShop);
  }
}

void _getProductsByShop(GetProductsByShop event, Emitter<ProductsByShopState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetProductsByShopWaiting());

  try {
    List<ProductByShopModel> data = await apiProvider.getProudctByShop(id: event.proudctID);
    emit(GetProductsByShopSuccess(productByShopData: data));
    data.forEach((element) {
      print(element);
    });
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetProductsByShopError(errorMessage: ex.toString()));
    }
  }

}
