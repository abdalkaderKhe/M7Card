part of 'game_categories_bloc.dart';

@immutable
abstract class GameCategoriesState {}

class GetGameCategoriesInitial extends GameCategoriesState {}

class GetGameCategoriesLoading extends GameCategoriesState {}

class GetGameCategoriesSuccess extends GameCategoriesState {
  final List<CategoryModel> categoryData;
  GetGameCategoriesSuccess({required this.categoryData});
}

class GetGameCategoriesError extends GameCategoriesState {
  String errorMessage;
  GetGameCategoriesError({required this.errorMessage});
}

