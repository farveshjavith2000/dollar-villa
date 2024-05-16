// ignore_for_file: must_be_immutable

part of 'dmt_failed_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtFailed widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtFailedEvent extends Equatable {}

/// Event that is dispatched when the DmtFailed widget is first created.
class DmtFailedInitialEvent extends DmtFailedEvent {
  @override
  List<Object?> get props => [];
}
