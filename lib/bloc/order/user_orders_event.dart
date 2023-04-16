part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersEvent {}

class GetOrdersDate extends UserOrdersEvent {}
