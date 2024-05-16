// ignore_for_file: must_be_immutable

part of 'electricity_bill_payment_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ElectricityBillPayment widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ElectricityBillPaymentEvent extends Equatable {}

/// Event that is dispatched when the ElectricityBillPayment widget is first created.
class ElectricityBillPaymentInitialEvent extends ElectricityBillPaymentEvent {
  @override
  List<Object?> get props => [];
}
