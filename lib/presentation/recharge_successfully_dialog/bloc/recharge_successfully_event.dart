// ignore_for_file: must_be_immutable

part of 'recharge_successfully_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RechargeSuccessfully widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RechargeSuccessfullyEvent extends Equatable {}

/// Event that is dispatched when the RechargeSuccessfully widget is first created.
class RechargeSuccessfullyInitialEvent extends RechargeSuccessfullyEvent {
  @override
  List<Object?> get props => [];
}
