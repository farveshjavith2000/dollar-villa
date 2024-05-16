// ignore_for_file: must_be_immutable

part of 'mobile_postpaid_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MobilePostpaid widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MobilePostpaidEvent extends Equatable {}

/// Event that is dispatched when the MobilePostpaid widget is first created.
class MobilePostpaidInitialEvent extends MobilePostpaidEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/MobileRecharge API.
class CreateMobileRechargeEvent extends MobilePostpaidEvent {
  CreateMobileRechargeEvent({
    this.onCreateMobileRechargeEventSuccess,
    this.onCreateMobileRechargeEventError,
  });

  Function? onCreateMobileRechargeEventSuccess;

  Function? onCreateMobileRechargeEventError;

  @override
  List<Object?> get props => [
        onCreateMobileRechargeEventSuccess,
        onCreateMobileRechargeEventError,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends MobilePostpaidEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
