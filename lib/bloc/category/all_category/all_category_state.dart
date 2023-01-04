part of 'all_category_bloc.dart';

@immutable
abstract class AllCategoryState {}

class AllCategoryInitial extends AllCategoryState {}

class CategoryError extends AllCategoryState {
  final String errorMessage;

  CategoryError({
    required this.errorMessage,
  });
}

class CategoryWaiting extends AllCategoryState {}

class GetCategorySuccess extends AllCategoryState {
  final List<CategoryModel> categoryData;
  GetCategorySuccess({required this.categoryData});
}
