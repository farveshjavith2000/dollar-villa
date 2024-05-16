// ignore_for_file: must_be_immutable

part of 'gass_bill_payment_bloc.dart';

/// Represents the state of GassBillPayment in the application.
class GassBillPaymentState extends Equatable {
  GassBillPaymentState({
    this.cANumbervalueController,
    this.selectedDropDownValue,
    this.gassBillPaymentModelObj,
  });

  TextEditingController? cANumbervalueController;

  SelectionPopupModel? selectedDropDownValue;

  GassBillPaymentModel? gassBillPaymentModelObj;

  @override
  List<Object?> get props => [
        cANumbervalueController,
        selectedDropDownValue,
        gassBillPaymentModelObj,
      ];
  GassBillPaymentState copyWith({
    TextEditingController? cANumbervalueController,
    SelectionPopupModel? selectedDropDownValue,
    GassBillPaymentModel? gassBillPaymentModelObj,
  }) {
    return GassBillPaymentState(
      cANumbervalueController:
          cANumbervalueController ?? this.cANumbervalueController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      gassBillPaymentModelObj:
          gassBillPaymentModelObj ?? this.gassBillPaymentModelObj,
    );
  }
}
