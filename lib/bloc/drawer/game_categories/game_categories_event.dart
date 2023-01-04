part of 'game_categories_bloc.dart';

@immutable
abstract class GameCategoriesEvent {}

class GetGameCategories extends GameCategoriesEvent {
  String url;
  GetGameCategories({required this.url});
}