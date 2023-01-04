import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'onlineshops_categories_event.dart';
part 'onlineshops_categories_state.dart';

class OnlineshopsCategoriesBloc extends Bloc<OnlineshopsCategoriesEvent, OnlineshopsCategoriesState> {
  OnlineshopsCategoriesBloc() : super(OnlineshopsCategoriesInitial()) {
    on<GetOnlineshopsCategories>(_getOnlineshopsCategories);
  }
}

void _getOnlineshopsCategories(GetOnlineshopsCategories event, Emitter<OnlineshopsCategoriesState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetOnlineshopsCategoriesLoading());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategoryGames(ONLINE_SHOPS_CATEGORIES);
    emit(GetOnlineshopsCategoriesSuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetOnlineshopsCategoriesError(errorMessage: ex.toString()));
    }
  }

}
