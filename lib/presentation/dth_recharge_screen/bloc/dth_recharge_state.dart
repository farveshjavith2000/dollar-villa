// ignore_for_file: must_be_immutable

part of 'dth_recharge_bloc.dart';

/// Represents the state of DthRecharge in the application.
class DthRechargeState extends Equatable {
  DthRechargeState({
    this.numberController,
    this.amountController,
    this.selectedDropDownValue,
    this.dthRechargeModelObj,
  });

  TextEditingController? numberController;

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  DthRechargeModel? dthRechargeModelObj;

  @override
  List<Object?> get props => [
        numberController,
        amountController,
        selectedDropDownValue,
        dthRechargeModelObj,
      ];
  DthRechargeState copyWith({
    TextEditingController? numberController,
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    DthRechargeModel? dthRechargeModelObj,
  }) {
    return DthRechargeState(
      numberController: numberController ?? this.numberController,
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      dthRechargeModelObj: dthRechargeModelObj ?? this.dthRechargeModelObj,
    );
  }
}
