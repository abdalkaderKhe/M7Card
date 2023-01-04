part of 'socialapps_categories_bloc.dart';

@immutable
abstract class SocialappsCategoriesState {}

class SocialappsCategoriesInitial extends SocialappsCategoriesState {}

class GetSocialappsCategoriesLoading extends SocialappsCategoriesState {}

class GetSocialappsCategoriesSuccess extends SocialappsCategoriesState {
  final List<CategoryModel> categoryData;
  GetSocialappsCategoriesSuccess({required this.categoryData});
}

class GetSocialappsCategoriesError extends SocialappsCategoriesState {
  String errorMessage;
  GetSocialappsCategoriesError({required this.errorMessage});
}


