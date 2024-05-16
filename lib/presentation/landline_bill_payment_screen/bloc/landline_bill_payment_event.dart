// ignore_for_file: must_be_immutable

part of 'landline_bill_payment_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LandlineBillPayment widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LandlineBillPaymentEvent extends Equatable {}

/// Event that is dispatched when the LandlineBillPayment widget is first created.
class LandlineBillPaymentInitialEvent extends LandlineBillPaymentEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends LandlineBillPaymentEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
