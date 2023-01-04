part of 'order_payment_bloc.dart';

@immutable
abstract class OrderPaymentState {}

class OrderPaymentInitial extends OrderPaymentState {}

class PostOrderPaymentLoadingState extends OrderPaymentState {}

class PostOrderPaymentSuccessState extends OrderPaymentState {}

class PostOrderPaymentErrorState extends OrderPaymentState {
  final String message;
  PostOrderPaymentErrorState({required this.message});
}

