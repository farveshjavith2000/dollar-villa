// ignore_for_file: must_be_immutable

part of 'reports_detail_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ReportsDetail widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReportsDetailEvent extends Equatable {}

/// Event that is dispatched when the ReportsDetail widget is first created.
class ReportsDetailInitialEvent extends ReportsDetailEvent {
  @override
  List<Object?> get props => [];
}
