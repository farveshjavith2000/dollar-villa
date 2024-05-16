import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/electricity_bill_payment_screen/models/electricity_bill_payment_model.dart';
part 'electricity_bill_payment_event.dart';
part 'electricity_bill_payment_state.dart';

/// A bloc that manages the state of a ElectricityBillPayment according to the event that is dispatched to it.
class ElectricityBillPaymentBloc
    extends Bloc<ElectricityBillPaymentEvent, ElectricityBillPaymentState> {
  ElectricityBillPaymentBloc(ElectricityBillPaymentState initialState)
      : super(initialState) {
    on<ElectricityBillPaymentInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ElectricityBillPaymentInitialEvent event,
    Emitter<ElectricityBillPaymentState> emit,
  ) async {
    emit(state.copyWith(
        phoneNumberController: TextEditingController(),
        checkmarkController: TextEditingController(),
        selectOperatorvalueController: TextEditingController(),
        amountController: TextEditingController()));
  }
}
