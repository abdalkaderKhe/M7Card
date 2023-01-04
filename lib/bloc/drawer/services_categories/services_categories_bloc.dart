import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'services_categories_event.dart';
part 'services_categories_state.dart';

class ServicesCategoriesBloc extends Bloc<ServicesCategoriesEvent, ServicesCategoriesState> {
  ServicesCategoriesBloc() : super(ServicesCategoriesInitial()) {
    on<GetServicesCategories>(_getServicesCategories);
  }
}

void _getServicesCategories(GetServicesCategories event, Emitter<ServicesCategoriesState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetServicesCategoriesLoading());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategoryGames(SERVICES_CATEGORIES);
    emit(GetServicesCategoriesSuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetServicesCategoriesError(errorMessage: ex.toString()));
    }
  }

}
