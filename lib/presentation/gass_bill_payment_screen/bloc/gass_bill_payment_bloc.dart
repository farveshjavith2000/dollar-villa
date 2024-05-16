import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/gass_bill_payment_screen/models/gass_bill_payment_model.dart';
part 'gass_bill_payment_event.dart';
part 'gass_bill_payment_state.dart';

/// A bloc that manages the state of a GassBillPayment according to the event that is dispatched to it.
class GassBillPaymentBloc
    extends Bloc<GassBillPaymentEvent, GassBillPaymentState> {
  GassBillPaymentBloc(GassBillPaymentState initialState) : super(initialState) {
    on<GassBillPaymentInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<GassBillPaymentState> emit,
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
    GassBillPaymentInitialEvent event,
    Emitter<GassBillPaymentState> emit,
  ) async {
    emit(state.copyWith(cANumbervalueController: TextEditingController()));
    emit(state.copyWith(
        gassBillPaymentModelObj: state.gassBillPaymentModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
