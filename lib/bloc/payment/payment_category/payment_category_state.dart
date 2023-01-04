part of 'payment_category_bloc.dart';

@immutable
abstract class PaymentCategoryState {}

class PaymentCategoryInitial extends PaymentCategoryState {}

class GetPaymentCategoryError extends PaymentCategoryState {
  final String errorMessage;
  GetPaymentCategoryError({
    required this.errorMessage,
  });
}

class GetPaymentCategoryWaiting extends PaymentCategoryState {}

class GetPaymentCategorySuccess extends PaymentCategoryState {
  final List<PaymentCategory> paymentCategoryData;
  GetPaymentCategorySuccess({required this.paymentCategoryData});
}

