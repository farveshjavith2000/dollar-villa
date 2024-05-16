import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/recharge_successfully_dialog/models/recharge_successfully_model.dart';
part 'recharge_successfully_event.dart';
part 'recharge_successfully_state.dart';

/// A bloc that manages the state of a RechargeSuccessfully according to the event that is dispatched to it.
class RechargeSuccessfullyBloc
    extends Bloc<RechargeSuccessfullyEvent, RechargeSuccessfullyState> {
  RechargeSuccessfullyBloc(RechargeSuccessfullyState initialState)
      : super(initialState) {
    on<RechargeSuccessfullyInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RechargeSuccessfullyInitialEvent event,
    Emitter<RechargeSuccessfullyState> emit,
  ) async {}
}
