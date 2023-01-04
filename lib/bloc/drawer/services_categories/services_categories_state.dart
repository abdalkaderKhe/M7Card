part of 'services_categories_bloc.dart';

@immutable
abstract class ServicesCategoriesState {}

class ServicesCategoriesInitial extends ServicesCategoriesState {}

class GetServicesCategoriesLoading extends ServicesCategoriesState {}

class GetServicesCategoriesSuccess extends ServicesCategoriesState {
  final List<CategoryModel> categoryData;
  GetServicesCategoriesSuccess({required this.categoryData});
}

class GetServicesCategoriesError extends ServicesCategoriesState {
  String errorMessage;
  GetServicesCategoriesError({required this.errorMessage});
}

