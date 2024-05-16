// ignore_for_file: must_be_immutable

part of 'dmt_success_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtSuccess widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtSuccessEvent extends Equatable {}

/// Event that is dispatched when the DmtSuccess widget is first created.
class DmtSuccessInitialEvent extends DmtSuccessEvent {
  @override
  List<Object?> get props => [];
}
