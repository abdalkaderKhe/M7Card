import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'socialapps_categories_event.dart';
part 'socialapps_categories_state.dart';

class SocialappsCategoriesBloc extends Bloc<SocialAppsCategoriesEvent, SocialappsCategoriesState> {
  SocialappsCategoriesBloc() : super(SocialappsCategoriesInitial()) {
    on<GetSocialAppsCategories>(_getSocialappsCategories);
  }
}

void _getSocialappsCategories(GetSocialAppsCategories event, Emitter<SocialappsCategoriesState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetSocialappsCategoriesLoading());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategoryGames(SOCIAlL_APPS_CATEGORIES);
    emit(GetSocialappsCategoriesSuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetSocialappsCategoriesError(errorMessage: ex.toString()));
    }
  }

}
