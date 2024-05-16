// ignore_for_file: must_be_immutable

part of 'dmt_verify_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtVerify widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtVerifyEvent extends Equatable {}

/// Event that is dispatched when the DmtVerify widget is first created.
class DmtVerifyInitialEvent extends DmtVerifyEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4SenderVerification API.
class CreateDmt4SenderVerificationEvent extends DmtVerifyEvent {
  CreateDmt4SenderVerificationEvent({
    this.onCreateDmt4SenderVerificationEventSuccess,
    this.onCreateDmt4SenderVerificationEventError,
  });

  Function? onCreateDmt4SenderVerificationEventSuccess;

  Function? onCreateDmt4SenderVerificationEventError;

  @override
  List<Object?> get props => [
        onCreateDmt4SenderVerificationEventSuccess,
        onCreateDmt4SenderVerificationEventError,
      ];
}
