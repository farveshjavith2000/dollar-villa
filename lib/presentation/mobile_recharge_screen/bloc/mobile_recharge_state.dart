// ignore_for_file: must_be_immutable

part of 'mobile_recharge_bloc.dart';

/// Represents the state of MobileRecharge in the application.
class MobileRechargeState extends Equatable {
  MobileRechargeState({
    this.phoneNumberController,
    this.amountController,
    this.selectedDropDownValue,
    this.mobileRechargeModelObj,
  });

  TextEditingController? phoneNumberController;

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  MobileRechargeModel? mobileRechargeModelObj;

  @override
  List<Object?> get props => [
        phoneNumberController,
        amountController,
        selectedDropDownValue,
        mobileRechargeModelObj,
      ];
  MobileRechargeState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    MobileRechargeModel? mobileRechargeModelObj,
  }) {
    return MobileRechargeState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      mobileRechargeModelObj:
          mobileRechargeModelObj ?? this.mobileRechargeModelObj,
    );
  }
}
