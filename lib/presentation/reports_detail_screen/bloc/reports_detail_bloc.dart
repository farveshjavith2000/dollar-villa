import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/reports_detail_screen/models/reports_detail_model.dart';
part 'reports_detail_event.dart';
part 'reports_detail_state.dart';

/// A bloc that manages the state of a ReportsDetail according to the event that is dispatched to it.
class ReportsDetailBloc extends Bloc<ReportsDetailEvent, ReportsDetailState> {
  ReportsDetailBloc(ReportsDetailState initialState) : super(initialState) {
    on<ReportsDetailInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReportsDetailInitialEvent event,
    Emitter<ReportsDetailState> emit,
  ) async {}
}
