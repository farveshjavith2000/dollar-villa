// ignore_for_file: must_be_immutable

part of 'landline_bill_payment_bloc.dart';

/// Represents the state of LandlineBillPayment in the application.
class LandlineBillPaymentState extends Equatable {
  LandlineBillPaymentState({
    this.numberController,
    this.amountController,
    this.selectedDropDownValue,
    this.landlineBillPaymentModelObj,
  });

  TextEditingController? numberController;

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  LandlineBillPaymentModel? landlineBillPaymentModelObj;

  @override
  List<Object?> get props => [
        numberController,
        amountController,
        selectedDropDownValue,
        landlineBillPaymentModelObj,
      ];
  LandlineBillPaymentState copyWith({
    TextEditingController? numberController,
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    LandlineBillPaymentModel? landlineBillPaymentModelObj,
  }) {
    return LandlineBillPaymentState(
      numberController: numberController ?? this.numberController,
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      landlineBillPaymentModelObj:
          landlineBillPaymentModelObj ?? this.landlineBillPaymentModelObj,
    );
  }
}
