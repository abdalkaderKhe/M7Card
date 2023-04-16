part of 'order_payment_bloc.dart';

@immutable
abstract class OrderPaymentEvent {}

class SubmitButtonPressEvent extends OrderPaymentEvent{
  String accName;
  String payment_way_id;
  //String userId;
  String amount;
  String balanceValue;
  String date;
  String note;

  SubmitButtonPressEvent({
    required this.accName,
    required this.payment_way_id,
    required this.amount,
    required this.balanceValue,
    required this.date,
    required this.note
  });
}