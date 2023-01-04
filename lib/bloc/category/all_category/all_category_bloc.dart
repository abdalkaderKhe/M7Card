import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
part 'all_category_event.dart';
part 'all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  AllCategoryBloc() : super(AllCategoryInitial()) {
    on<GetAllCategory>(_getCategory);
  }
}

void _getCategory(GetAllCategory event, Emitter<AllCategoryState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(CategoryWaiting());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategory(ALL_CATEGORY);
    emit(GetCategorySuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(CategoryError(errorMessage: ex.toString()));
    }
  }

}
