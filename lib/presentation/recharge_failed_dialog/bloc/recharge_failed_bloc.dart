import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/recharge_failed_dialog/models/recharge_failed_model.dart';
part 'recharge_failed_event.dart';
part 'recharge_failed_state.dart';

/// A bloc that manages the state of a RechargeFailed according to the event that is dispatched to it.
class RechargeFailedBloc
    extends Bloc<RechargeFailedEvent, RechargeFailedState> {
  RechargeFailedBloc(RechargeFailedState initialState) : super(initialState) {
    on<RechargeFailedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RechargeFailedInitialEvent event,
    Emitter<RechargeFailedState> emit,
  ) async {}
}
