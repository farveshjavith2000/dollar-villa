// ignore_for_file: must_be_immutable

part of 'dash_board_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DashBoard widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DashBoardEvent extends Equatable {}

/// Event that is dispatched when the DashBoard widget is first created.
class DashBoardInitialEvent extends DashBoardEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing radio button
class ChangeRadioButtonEvent extends DashBoardEvent {
  ChangeRadioButtonEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}
