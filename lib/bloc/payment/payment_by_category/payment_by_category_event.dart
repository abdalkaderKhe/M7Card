part of 'payment_by_category_bloc.dart';

@immutable
abstract class PaymentByCategoryEvent {}

class GetPaymentByCategory extends PaymentByCategoryEvent{
  int paymentCategoryID;
  GetPaymentByCategory({required this.paymentCategoryID});
}

