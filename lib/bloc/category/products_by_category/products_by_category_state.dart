part of 'products_by_category_bloc.dart';

@immutable
abstract class ProductsByCategoryState {}

class ProductsByCategoryInitial extends ProductsByCategoryState {}

class GetProductsByCategoryError extends ProductsByCategoryState {
  final String errorMessage;

  GetProductsByCategoryError({
    required this.errorMessage,
  });
}

class GetProductsByCategoryWaiting extends ProductsByCategoryState {}

class GetProductsByCategorySuccess extends ProductsByCategoryState {
  final List<ProductByCategory> productByCategoryData;
  GetProductsByCategorySuccess({required this.productByCategoryData});
}
