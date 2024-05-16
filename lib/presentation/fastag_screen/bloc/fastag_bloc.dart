import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/fastag_screen/models/fastag_model.dart';
part 'fastag_event.dart';
part 'fastag_state.dart';

/// A bloc that manages the state of a Fastag according to the event that is dispatched to it.
class FastagBloc extends Bloc<FastagEvent, FastagState> {
  FastagBloc(FastagState initialState) : super(initialState) {
    on<FastagInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FastagState> emit,
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
    FastagInitialEvent event,
    Emitter<FastagState> emit,
  ) async {
    emit(state.copyWith(vehicleNumbervalueController: TextEditingController()));
    emit(state.copyWith(
        fastagModelObj: state.fastagModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
