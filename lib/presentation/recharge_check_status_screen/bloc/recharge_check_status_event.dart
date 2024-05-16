// ignore_for_file: must_be_immutable

part of 'recharge_check_status_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RechargeCheckStatus widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RechargeCheckStatusEvent extends Equatable {}

/// Event that is dispatched when the RechargeCheckStatus widget is first created.
class RechargeCheckStatusInitialEvent extends RechargeCheckStatusEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Rechargecheckstatus API.
class CreateRechargecheckstatusEvent extends RechargeCheckStatusEvent {
  CreateRechargecheckstatusEvent();

  @override
  List<Object?> get props => [];
}
