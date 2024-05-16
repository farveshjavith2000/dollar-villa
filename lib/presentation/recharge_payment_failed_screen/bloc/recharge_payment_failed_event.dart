// ignore_for_file: must_be_immutable

part of 'recharge_payment_failed_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RechargePaymentFailed widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RechargePaymentFailedEvent extends Equatable {}

/// Event that is dispatched when the RechargePaymentFailed widget is first created.
class RechargePaymentFailedInitialEvent extends RechargePaymentFailedEvent {
  @override
  List<Object?> get props => [];
}
