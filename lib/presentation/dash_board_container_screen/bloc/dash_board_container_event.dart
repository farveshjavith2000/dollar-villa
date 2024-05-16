// ignore_for_file: must_be_immutable

part of 'dash_board_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DashBoardContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DashBoardContainerEvent extends Equatable {}

/// Event that is dispatched when the DashBoardContainer widget is first created.
class DashBoardContainerInitialEvent extends DashBoardContainerEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/WalletBalance API.
class CreateWalletBalanceEvent extends DashBoardContainerEvent {
  CreateWalletBalanceEvent();

  @override
  List<Object?> get props => [];
}

///Event for changing radio button
class ChangeRadioButtonEvent extends DashBoardContainerEvent {
  ChangeRadioButtonEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
    value,
  ];
}
