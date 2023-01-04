part of 'products_by_category_bloc.dart';

@immutable
abstract class ProductsByCategoryEvent {}

class GetProductsByCategory extends ProductsByCategoryEvent {
  int CategoryID;
  GetProductsByCategory({required this.CategoryID});
}
