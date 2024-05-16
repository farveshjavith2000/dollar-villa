// ignore_for_file: must_be_immutable

part of 'electricity_bill_payment_bloc.dart';

/// Represents the state of ElectricityBillPayment in the application.
class ElectricityBillPaymentState extends Equatable {
  ElectricityBillPaymentState({
    this.phoneNumberController,
    this.checkmarkController,
    this.selectOperatorvalueController,
    this.amountController,
    this.electricityBillPaymentModelObj,
  });

  TextEditingController? phoneNumberController;

  TextEditingController? checkmarkController;

  TextEditingController? selectOperatorvalueController;

  TextEditingController? amountController;

  ElectricityBillPaymentModel? electricityBillPaymentModelObj;

  @override
  List<Object?> get props => [
        phoneNumberController,
        checkmarkController,
        selectOperatorvalueController,
        amountController,
        electricityBillPaymentModelObj,
      ];
  ElectricityBillPaymentState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? checkmarkController,
    TextEditingController? selectOperatorvalueController,
    TextEditingController? amountController,
    ElectricityBillPaymentModel? electricityBillPaymentModelObj,
  }) {
    return ElectricityBillPaymentState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      checkmarkController: checkmarkController ?? this.checkmarkController,
      selectOperatorvalueController:
          selectOperatorvalueController ?? this.selectOperatorvalueController,
      amountController: amountController ?? this.amountController,
      electricityBillPaymentModelObj:
          electricityBillPaymentModelObj ?? this.electricityBillPaymentModelObj,
    );
  }
}
