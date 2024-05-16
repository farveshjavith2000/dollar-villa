import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dth_recharge_screen/models/dth_recharge_model.dart';
part 'dth_recharge_event.dart';
part 'dth_recharge_state.dart';

/// A bloc that manages the state of a DthRecharge according to the event that is dispatched to it.
class DthRechargeBloc extends Bloc<DthRechargeEvent, DthRechargeState> {
  DthRechargeBloc(DthRechargeState initialState) : super(initialState) {
    on<DthRechargeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<DthRechargeState> emit,
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
    DthRechargeInitialEvent event,
    Emitter<DthRechargeState> emit,
  ) async {
    emit(state.copyWith(
        numberController: TextEditingController(),
        amountController: TextEditingController()));
    emit(state.copyWith(
        dthRechargeModelObj: state.dthRechargeModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
