part of 'order_payment_bloc.dart';

@immutable
abstract class OrderPaymentEvent {}

class SubmitButtonPressEvent extends OrderPaymentEvent{
  String accName;
  String userId;
  String amount;
  String balanceValue;
  String date;
  String note;

  SubmitButtonPressEvent({
    required this.accName,
    required this.userId,
    required this.amount,
    required this.balanceValue,
    required this.date,
    required this.note
  });
}