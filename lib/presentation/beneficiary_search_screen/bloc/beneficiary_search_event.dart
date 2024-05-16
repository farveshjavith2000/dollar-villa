// ignore_for_file: must_be_immutable

part of 'beneficiary_search_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///BeneficiarySearch widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BeneficiarySearchEvent extends Equatable {}

/// Event that is dispatched when the BeneficiarySearch widget is first created.
class BeneficiarySearchInitialEvent extends BeneficiarySearchEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4DeleteBeneficiary API.
class CreateDmt4DeleteBeneficiaryEvent extends BeneficiarySearchEvent {
  CreateDmt4DeleteBeneficiaryEvent();

  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4GetRecipientsList API.
class CreateDmt4GetRecipientsListEvent extends BeneficiarySearchEvent {
  CreateDmt4GetRecipientsListEvent();

  @override
  List<Object?> get props => [];
}
