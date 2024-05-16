import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/reports_filter_dialog/models/reports_filter_model.dart';
part 'reports_filter_event.dart';
part 'reports_filter_state.dart';

/// A bloc that manages the state of a ReportsFilter according to the event that is dispatched to it.
class ReportsFilterBloc extends Bloc<ReportsFilterEvent, ReportsFilterState> {
  ReportsFilterBloc(ReportsFilterState initialState) : super(initialState) {
    on<ReportsFilterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReportsFilterInitialEvent event,
    Emitter<ReportsFilterState> emit,
  ) async {
    emit(state.copyWith(
        mobileNumberController: TextEditingController(),
        enterAccountNoController: TextEditingController(),
        enterTIDController: TextEditingController()));
  }
}
