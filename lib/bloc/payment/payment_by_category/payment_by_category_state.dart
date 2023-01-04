part of 'payment_by_category_bloc.dart';

@immutable
abstract class PaymentByCategoryState {}

class GetPaymentByCategoryInitial extends PaymentByCategoryState {}

class GetPaymentByCategoryError extends PaymentByCategoryState {
  final String errorMessage;
  GetPaymentByCategoryError({
    required this.errorMessage,
  });
}

class GetPaymentByCategoryWaiting extends PaymentByCategoryState {}

class GetPaymentByCategorySuccess extends PaymentByCategoryState {
  final List<PaymentByCategory> paymentByCategoryData;
  GetPaymentByCategorySuccess({required this.paymentByCategoryData});
}

