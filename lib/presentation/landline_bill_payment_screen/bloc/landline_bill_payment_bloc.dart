import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/landline_bill_payment_screen/models/landline_bill_payment_model.dart';
part 'landline_bill_payment_event.dart';
part 'landline_bill_payment_state.dart';

/// A bloc that manages the state of a LandlineBillPayment according to the event that is dispatched to it.
class LandlineBillPaymentBloc
    extends Bloc<LandlineBillPaymentEvent, LandlineBillPaymentState> {
  LandlineBillPaymentBloc(LandlineBillPaymentState initialState)
      : super(initialState) {
    on<LandlineBillPaymentInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<LandlineBillPaymentState> emit,
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
    LandlineBillPaymentInitialEvent event,
    Emitter<LandlineBillPaymentState> emit,
  ) async {
    emit(state.copyWith(
        numberController: TextEditingController(),
        amountController: TextEditingController()));
    emit(state.copyWith(
        landlineBillPaymentModelObj: state.landlineBillPaymentModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }
}
