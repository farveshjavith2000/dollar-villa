import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/fund_transfer_success_dialog/models/fund_transfer_success_model.dart';
part 'fund_transfer_success_event.dart';
part 'fund_transfer_success_state.dart';

/// A bloc that manages the state of a FundTransferSuccess according to the event that is dispatched to it.
class FundTransferSuccessBloc
    extends Bloc<FundTransferSuccessEvent, FundTransferSuccessState> {
  FundTransferSuccessBloc(FundTransferSuccessState initialState)
      : super(initialState) {
    on<FundTransferSuccessInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FundTransferSuccessInitialEvent event,
    Emitter<FundTransferSuccessState> emit,
  ) async {}
}
