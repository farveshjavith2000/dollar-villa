import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/mobile_recharge_screen/models/mobile_recharge_model.dart';
part 'mobile_recharge_event.dart';
part 'mobile_recharge_state.dart';

/// A bloc that manages the state of a MobileRecharge according to the event that is dispatched to it.
class MobileRechargeBloc
    extends Bloc<MobileRechargeEvent, MobileRechargeState> {
  MobileRechargeBloc(MobileRechargeState initialState) : super(initialState) {
    on<MobileRechargeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<MobileRechargeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  _onInitialize(
    MobileRechargeInitialEvent event,
    Emitter<MobileRechargeState> emit,
  ) async {
    emit(state.copyWith(
        phoneNumberController: TextEditingController(),
        amountController: TextEditingController()));
    emit(state.copyWith(
        mobileRechargeModelObj: state.mobileRechargeModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
