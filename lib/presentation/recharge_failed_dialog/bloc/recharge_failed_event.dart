// ignore_for_file: must_be_immutable

part of 'recharge_failed_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RechargeFailed widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RechargeFailedEvent extends Equatable {}

/// Event that is dispatched when the RechargeFailed widget is first created.
class RechargeFailedInitialEvent extends RechargeFailedEvent {
  @override
  List<Object?> get props => [];
}
