// ignore_for_file: must_be_immutable

part of 'my_accout_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MyAccout widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MyAccoutEvent extends Equatable {}

/// Event that is dispatched when the MyAccout widget is first created.
class MyAccoutInitialEvent extends MyAccoutEvent {
  @override
  List<Object?> get props => [];
}
