import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dmt_success_dialog/models/dmt_success_model.dart';
part 'dmt_success_event.dart';
part 'dmt_success_state.dart';

/// A bloc that manages the state of a DmtSuccess according to the event that is dispatched to it.
class DmtSuccessBloc extends Bloc<DmtSuccessEvent, DmtSuccessState> {
  DmtSuccessBloc(DmtSuccessState initialState) : super(initialState) {
    on<DmtSuccessInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DmtSuccessInitialEvent event,
    Emitter<DmtSuccessState> emit,
  ) async {}
}
