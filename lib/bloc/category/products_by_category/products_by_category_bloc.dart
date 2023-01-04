import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/product_by_category.dart';
import 'package:m7card/network/api_provider.dart';

part 'products_by_category_event.dart';
part 'products_by_category_state.dart';

class ProductsByCategoryBloc extends Bloc<ProductsByCategoryEvent, ProductsByCategoryState> {
  ProductsByCategoryBloc() : super(ProductsByCategoryInitial()) {
    on<GetProductsByCategory>(_getProductsByCategory);
  }
}

void _getProductsByCategory(GetProductsByCategory event, Emitter<ProductsByCategoryState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetProductsByCategoryWaiting());

  try {
    List<ProductByCategory> data = await apiProvider.getProductByCategory(PRODUCTS_BY_CATEGORY,event.CategoryID.toString());
    emit(GetProductsByCategorySuccess(productByCategoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetProductsByCategoryError(errorMessage: ex.toString()));
    }
  }

}
