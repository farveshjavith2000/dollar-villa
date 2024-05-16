import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/broadband_screen/models/broadband_model.dart';
part 'broadband_event.dart';
part 'broadband_state.dart';

/// A bloc that manages the state of a Broadband according to the event that is dispatched to it.
class BroadbandBloc extends Bloc<BroadbandEvent, BroadbandState> {
  BroadbandBloc(BroadbandState initialState) : super(initialState) {
    on<BroadbandInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<BroadbandState> emit,
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
    BroadbandInitialEvent event,
    Emitter<BroadbandState> emit,
  ) async {
    emit(state.copyWith(
        numbervalueController: TextEditingController(),
        amountController: TextEditingController()));
    emit(state.copyWith(
        broadbandModelObj: state.broadbandModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
