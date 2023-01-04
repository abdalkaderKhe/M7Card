part of 'giftcards_categories_bloc.dart';

@immutable
abstract class GiftcardsCategoriesState {}

class GiftcardsCategoriesInitial extends GiftcardsCategoriesState {}

class GetGiftcardsCategoriesLoading extends GiftcardsCategoriesState {}

class GetGiftcardsCategoriesSuccess extends GiftcardsCategoriesState {
  final List<CategoryModel> categoryData;
  GetGiftcardsCategoriesSuccess({required this.categoryData});
}

class GetGiftcardsCategoriesError extends GiftcardsCategoriesState {
  String errorMessage;
  GetGiftcardsCategoriesError({required this.errorMessage});
}


