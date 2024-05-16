import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dmt_failed_screen/models/dmt_failed_model.dart';
part 'dmt_failed_event.dart';
part 'dmt_failed_state.dart';

/// A bloc that manages the state of a DmtFailed according to the event that is dispatched to it.
class DmtFailedBloc extends Bloc<DmtFailedEvent, DmtFailedState> {
  DmtFailedBloc(DmtFailedState initialState) : super(initialState) {
    on<DmtFailedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DmtFailedInitialEvent event,
    Emitter<DmtFailedState> emit,
  ) async {}
}
