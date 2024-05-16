// ignore_for_file: must_be_immutable

part of 'mobile_recharge_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MobileRecharge widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MobileRechargeEvent extends Equatable {}

/// Event that is dispatched when the MobileRecharge widget is first created.
class MobileRechargeInitialEvent extends MobileRechargeEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends MobileRechargeEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
