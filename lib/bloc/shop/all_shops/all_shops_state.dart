part of 'all_shops_bloc.dart';

@immutable
abstract class AllShopsState {}

class AllShopsInitial extends AllShopsState {}

class ShopError extends AllShopsState {
  final String errorMessage;

  ShopError({
    required this.errorMessage,
  });
}

class ShopWaiting extends AllShopsState {}

class GetAllShopsSuccess extends AllShopsState {
  final List<Shop> shopData;
  GetAllShopsSuccess({required this.shopData});
}
