// ignore_for_file: must_be_immutable

part of 'add_beneficiary_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddBeneficiary widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddBeneficiaryEvent extends Equatable {}

/// Event that is dispatched when the AddBeneficiary widget is first created.
class AddBeneficiaryInitialEvent extends AddBeneficiaryEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://app.victoriaepay.com/Dmt4AddNewBeneficiary API.
class CreateDmt4AddNewBeneficiaryEvent extends AddBeneficiaryEvent {
  CreateDmt4AddNewBeneficiaryEvent({
    this.onCreateDmt4AddNewBeneficiaryEventSuccess,
    this.onCreateDmt4AddNewBeneficiaryEventError,
  });

  Function? onCreateDmt4AddNewBeneficiaryEventSuccess;

  Function? onCreateDmt4AddNewBeneficiaryEventError;

  @override
  List<Object?> get props => [
        onCreateDmt4AddNewBeneficiaryEventSuccess,
        onCreateDmt4AddNewBeneficiaryEventError,
      ];
}
