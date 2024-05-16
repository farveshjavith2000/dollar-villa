// ignore_for_file: must_be_immutable

part of 'mobile_postpaid_bloc.dart';

/// Represents the state of MobilePostpaid in the application.
class MobilePostpaidState extends Equatable {
  MobilePostpaidState({
    this.numbervalueController,
    this.amountController,
    this.selectedDropDownValue,
    this.page,
    this.mobilePostpaidModelObj,
  });

  TextEditingController? numbervalueController;

  TextEditingController? amountController;

  SelectionPopupModel? selectedDropDownValue;

  MobilePostpaidModel? mobilePostpaidModelObj;

  var page;

  @override
  List<Object?> get props => [
        numbervalueController,
        amountController,
        selectedDropDownValue,
        page,
        mobilePostpaidModelObj,
      ];
  MobilePostpaidState copyWith({
    TextEditingController? numbervalueController,
    TextEditingController? amountController,
    SelectionPopupModel? selectedDropDownValue,
    var page,
    MobilePostpaidModel? mobilePostpaidModelObj,
  }) {
    return MobilePostpaidState(
      numbervalueController:
          numbervalueController ?? this.numbervalueController,
      amountController: amountController ?? this.amountController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      page: page ?? this.page,
      mobilePostpaidModelObj:
          mobilePostpaidModelObj ?? this.mobilePostpaidModelObj,
    );
  }
}
