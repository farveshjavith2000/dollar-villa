import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/recharge_payment_failed_screen/models/recharge_payment_failed_model.dart';
part 'recharge_payment_failed_event.dart';
part 'recharge_payment_failed_state.dart';

/// A bloc that manages the state of a RechargePaymentFailed according to the event that is dispatched to it.
class RechargePaymentFailedBloc
    extends Bloc<RechargePaymentFailedEvent, RechargePaymentFailedState> {
  RechargePaymentFailedBloc(RechargePaymentFailedState initialState)
      : super(initialState) {
    on<RechargePaymentFailedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RechargePaymentFailedInitialEvent event,
    Emitter<RechargePaymentFailedState> emit,
  ) async {}
}
