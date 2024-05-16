// ignore_for_file: must_be_immutable

part of 'gass_bill_payment_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GassBillPayment widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class GassBillPaymentEvent extends Equatable {}

/// Event that is dispatched when the GassBillPayment widget is first created.
class GassBillPaymentInitialEvent extends GassBillPaymentEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends GassBillPaymentEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
