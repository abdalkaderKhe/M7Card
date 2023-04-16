part of 'products_by_shop_bloc.dart';

@immutable
abstract class ProductsByShopEvent {}

class GetProductsByShop extends ProductsByShopEvent {
  int proudctID;
  GetProductsByShop({required this.proudctID});
}
