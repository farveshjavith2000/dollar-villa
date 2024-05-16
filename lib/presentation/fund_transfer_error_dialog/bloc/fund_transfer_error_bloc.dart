import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/fund_transfer_error_dialog/models/fund_transfer_error_model.dart';
part 'fund_transfer_error_event.dart';
part 'fund_transfer_error_state.dart';

/// A bloc that manages the state of a FundTransferError according to the event that is dispatched to it.
class FundTransferErrorBloc
    extends Bloc<FundTransferErrorEvent, FundTransferErrorState> {
  FundTransferErrorBloc(FundTransferErrorState initialState)
      : super(initialState) {
    on<FundTransferErrorInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FundTransferErrorInitialEvent event,
    Emitter<FundTransferErrorState> emit,
  ) async {}
}
