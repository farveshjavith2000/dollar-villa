// ignore_for_file: must_be_immutable

part of 'reports_filter_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReportsFilter widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReportsFilterEvent extends Equatable {}

/// Event that is dispatched when the ReportsFilter widget is first created.
class ReportsFilterInitialEvent extends ReportsFilterEvent {
  @override
  List<Object?> get props => [];
}
