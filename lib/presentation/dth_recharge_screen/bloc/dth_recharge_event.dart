// ignore_for_file: must_be_immutable

part of 'dth_recharge_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DthRecharge widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DthRechargeEvent extends Equatable {}

/// Event that is dispatched when the DthRecharge widget is first created.
class DthRechargeInitialEvent extends DthRechargeEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends DthRechargeEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
