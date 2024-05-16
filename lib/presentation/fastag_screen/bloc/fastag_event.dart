// ignore_for_file: must_be_immutable

part of 'fastag_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Fastag widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FastagEvent extends Equatable {}

/// Event that is dispatched when the Fastag widget is first created.
class FastagInitialEvent extends FastagEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends FastagEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
