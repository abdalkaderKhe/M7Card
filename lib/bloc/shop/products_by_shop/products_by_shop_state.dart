part of 'products_by_shop_bloc.dart';

@immutable
abstract class ProductsByShopState {}

class ProductsByShopInitial extends ProductsByShopState {}

class GetProductsByShopWaiting extends ProductsByShopState {}

class GetProductsByShopSuccess extends ProductsByShopState {
  final List<ProductByShopModel> productByShopData;
  GetProductsByShopSuccess({required this.productByShopData});
}

class GetProductsByShopError extends ProductsByShopState {
  final String errorMessage;

  GetProductsByShopError({
    required this.errorMessage,
  });
}
