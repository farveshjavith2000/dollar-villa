import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dash_board_page/models/dash_board_model.dart';
part 'dash_board_event.dart';
part 'dash_board_state.dart';

/// A bloc that manages the state of a DashBoard according to the event that is dispatched to it.
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc(DashBoardState initialState) : super(initialState) {
    on<DashBoardInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<DashBoardState> emit,
  ) {
    emit(state.copyWith(radioGroup: event.value));
  }

  _onInitialize(
    DashBoardInitialEvent event,
    Emitter<DashBoardState> emit,
  ) async {
    emit(state.copyWith(radioGroup: ""));
  }
}
