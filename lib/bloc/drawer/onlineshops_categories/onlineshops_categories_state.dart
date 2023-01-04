part of 'onlineshops_categories_bloc.dart';

@immutable
abstract class OnlineshopsCategoriesState {}

class OnlineshopsCategoriesInitial extends OnlineshopsCategoriesState {}

class GetOnlineshopsCategoriesLoading extends OnlineshopsCategoriesState {}

class GetOnlineshopsCategoriesSuccess extends OnlineshopsCategoriesState {
  final List<CategoryModel> categoryData;
  GetOnlineshopsCategoriesSuccess({required this.categoryData});
}

class GetOnlineshopsCategoriesError extends OnlineshopsCategoriesState {
  String errorMessage;
  GetOnlineshopsCategoriesError({required this.errorMessage});
}

