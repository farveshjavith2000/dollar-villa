// ignore_for_file: must_be_immutable

part of 'bbps_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Bbps widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BbpsEvent extends Equatable {}

/// Event that is dispatched when the Bbps widget is first created.
class BbpsInitialEvent extends BbpsEvent {
  @override
  List<Object?> get props => [];
}
