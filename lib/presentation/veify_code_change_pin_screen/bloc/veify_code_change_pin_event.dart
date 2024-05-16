// ignore_for_file: must_be_immutable

part of 'veify_code_change_pin_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///VeifyCodeChangePin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class VeifyCodeChangePinEvent extends Equatable {}

/// Event that is dispatched when the VeifyCodeChangePin widget is first created.
class VeifyCodeChangePinInitialEvent extends VeifyCodeChangePinEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/VerifyTpinotp API.
class CreateVerifyTpinotpEvent extends VeifyCodeChangePinEvent {
  CreateVerifyTpinotpEvent({
    this.onCreateVerifyTpinotpEventSuccess,
    this.onCreateVerifyTpinotpEventError,
  });

  Function? onCreateVerifyTpinotpEventSuccess;

  Function? onCreateVerifyTpinotpEventError;

  @override
  List<Object?> get props => [
        onCreateVerifyTpinotpEventSuccess,
        onCreateVerifyTpinotpEventError,
      ];
}
