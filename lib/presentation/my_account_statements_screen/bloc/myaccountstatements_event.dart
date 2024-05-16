// ignore_for_file: must_be_immutable

part of 'myaccountstatements_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///myaccountstatements widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class myaccountstatementsEvent extends Equatable {}

/// Event that is dispatched when the myaccountstatements widget is first created.
class myaccountstatementsInitialEvent extends myaccountstatementsEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4myaccountstatement API.
class CreateDmt4myaccountstatementEvent extends myaccountstatementsEvent {
  CreateDmt4myaccountstatementEvent({
    this.onCreateDmt4myaccountstatementEventSuccess,
    this.onCreateDmt4myaccountstatementEventError,
  });

  Function? onCreateDmt4myaccountstatementEventSuccess;

  Function? onCreateDmt4myaccountstatementEventError;

  @override
  List<Object?> get props => [
        onCreateDmt4myaccountstatementEventSuccess,
        onCreateDmt4myaccountstatementEventError,
      ];
}
