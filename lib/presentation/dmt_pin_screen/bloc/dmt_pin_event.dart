// ignore_for_file: must_be_immutable

part of 'dmt_pin_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DmtPin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DmtPinEvent extends Equatable {}

/// Event that is dispatched when the DmtPin widget is first created.
class DmtPinInitialEvent extends DmtPinEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Checking_Tpin API.
class CreateCheckingTpinEvent extends DmtPinEvent {
  CreateCheckingTpinEvent({
    this.onCreateCheckingTpinEventSuccess,
    this.onCreateCheckingTpinEventError,
  });

  Function? onCreateCheckingTpinEventSuccess;

  Function? onCreateCheckingTpinEventError;

  @override
  List<Object?> get props => [
        onCreateCheckingTpinEventSuccess,
        onCreateCheckingTpinEventError,
      ];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4FundTransfer API.
class CreateDmt4FundTransferEvent extends DmtPinEvent {
  CreateDmt4FundTransferEvent();

  @override
  List<Object?> get props => [];
}



///Event for changing password visibility
class ChangePasswordVisibilityEvent extends DmtPinEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
