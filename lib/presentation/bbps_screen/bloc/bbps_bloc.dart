import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/bbps_screen/models/bbps_model.dart';
part 'bbps_event.dart';
part 'bbps_state.dart';

/// A bloc that manages the state of a Bbps according to the event that is dispatched to it.
class BbpsBloc extends Bloc<BbpsEvent, BbpsState> {
  BbpsBloc(BbpsState initialState) : super(initialState) {
    on<BbpsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BbpsInitialEvent event,
    Emitter<BbpsState> emit,
  ) async {
    emit(state.copyWith(
        enterNumbervalueController: TextEditingController(),
        emailController: TextEditingController()));
  }
}
