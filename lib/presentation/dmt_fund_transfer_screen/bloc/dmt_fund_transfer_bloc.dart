import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dmt_fund_transfer_screen/models/dmt_fund_transfer_model.dart';
part 'dmt_fund_transfer_event.dart';
part 'dmt_fund_transfer_state.dart';

/// A bloc that manages the state of a DmtFundTransfer according to the event that is dispatched to it.
class DmtFundTransferBloc
    extends Bloc<DmtFundTransferEvent, DmtFundTransferState> {
  DmtFundTransferBloc(DmtFundTransferState initialState) : super(initialState) {
    on<DmtFundTransferInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<DmtFundTransferState> emit,
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
    DmtFundTransferInitialEvent event,
    Emitter<DmtFundTransferState> emit,
  ) async {
    emit(state.copyWith(amountController: TextEditingController()));
    emit(state.copyWith(
        dmtFundTransferModelObj: state.dmtFundTransferModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
