// ignore_for_file: must_be_immutable

part of 'reports_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Reports widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReportsEvent extends Equatable {}

/// Event that is dispatched when the Reports widget is first created.
class ReportsInitialEvent extends ReportsEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4Report API.
class CreateDmt4ReportEvent extends ReportsEvent {
  CreateDmt4ReportEvent({
    this.onCreateDmt4ReportEventSuccess,
    this.onCreateDmt4ReportEventError,
  });

  Function? onCreateDmt4ReportEventSuccess;

  Function? onCreateDmt4ReportEventError;

  @override
  List<Object?> get props => [
        onCreateDmt4ReportEventSuccess,
        onCreateDmt4ReportEventError,
      ];
}
