// ignore_for_file: must_be_immutable

part of 'broadband_bloc.dart';

/// Represents the state of Broadband in the application.
class BroadbandState extends Equatable {
  BroadbandState({
    this.numbervalueController,
    this.amountController,
    this.selectedDropDownValue,
    this.broadbandModelObj,
  });

  TextEditingController? numbervalueController;

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  BroadbandModel? broadbandModelObj;

  @override
  List<Object?> get props => [
        numbervalueController,
        amountController,
        selectedDropDownValue,
        broadbandModelObj,
      ];
  BroadbandState copyWith({
    TextEditingController? numbervalueController,
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    BroadbandModel? broadbandModelObj,
  }) {
    return BroadbandState(
      numbervalueController:
          numbervalueController ?? this.numbervalueController,
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      broadbandModelObj: broadbandModelObj ?? this.broadbandModelObj,
    );
  }
}
