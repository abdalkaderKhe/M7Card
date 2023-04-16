part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersState {}

class UserOrdersInitial extends UserOrdersState {}

class GetUserOrdersError extends UserOrdersState {
  final String errorMessage;
  GetUserOrdersError({
    required this.errorMessage,
  });
}

class GetUserOrdersWaiting extends UserOrdersState {}

class GetUserOrdersSuccess extends UserOrdersState {
  final List<Order> orderData;
  GetUserOrdersSuccess({required this.orderData});
}

