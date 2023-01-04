import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_by_shop_event.dart';
part 'products_by_shop_state.dart';

class ProductsByShopBloc extends Bloc<ProductsByShopEvent, ProductsByShopState> {
  ProductsByShopBloc() : super(ProductsByShopInitial()) {
    on<ProductsByShopEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
