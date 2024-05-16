// ignore_for_file: must_be_immutable

part of 'broadband_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Broadband widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BroadbandEvent extends Equatable {}

/// Event that is dispatched when the Broadband widget is first created.
class BroadbandInitialEvent extends BroadbandEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends BroadbandEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
