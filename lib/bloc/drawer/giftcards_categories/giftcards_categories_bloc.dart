import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'giftcards_categories_event.dart';
part 'giftcards_categories_state.dart';

class GiftcardsCategoriesBloc extends Bloc<GiftcardsCategoriesEvent, GiftcardsCategoriesState> {
  GiftcardsCategoriesBloc() : super(GiftcardsCategoriesInitial()) {
    on<GetGiftcardsCategories>(_getGiftcardsCategories);
  }
}

void _getGiftcardsCategories(GetGiftcardsCategories event, Emitter<GiftcardsCategoriesState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetGiftcardsCategoriesLoading());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategoryGames(GIFTCARDS_CATEGORIES);
    emit(GetGiftcardsCategoriesSuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetGiftcardsCategoriesError(errorMessage: ex.toString()));
    }
  }

}
