import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m7card/config/constants.dart';
import 'package:m7card/model/category.dart';
import 'package:m7card/network/api_provider.dart';
import 'package:meta/meta.dart';

part 'game_categories_event.dart';
part 'game_categories_state.dart';

class GameCategoriesBloc extends Bloc<GameCategoriesEvent, GameCategoriesState> {
  GameCategoriesBloc() : super(GetGameCategoriesInitial()) {
    on<GetGameCategories>(_getGameCategories);
  }
}

void _getGameCategories(GetGameCategories event, Emitter<GameCategoriesState> emit) async {
  ApiProvider apiProvider = ApiProvider();
  emit(GetGameCategoriesLoading());
  try {
    List<CategoryModel> data = await apiProvider.getAllCategoryGames(event.url);
    emit(GetGameCategoriesSuccess(categoryData: data));
  }
  catch (ex)
  {
    if(ex != 'cancel'){
      emit(GetGameCategoriesError(errorMessage: ex.toString()));
    }
  }

}