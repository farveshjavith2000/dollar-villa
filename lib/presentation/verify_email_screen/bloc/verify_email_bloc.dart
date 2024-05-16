import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/verify_email_screen/models/verify_email_model.dart';
part 'verify_email_event.dart';
part 'verify_email_state.dart';

/// A bloc that manages the state of a VerifyEmail according to the event that is dispatched to it.
class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc(VerifyEmailState initialState) : super(initialState) {
    on<VerifyEmailInitialEvent>(_onInitialize);
  }

  _onInitialize(
    VerifyEmailInitialEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    emit(state.copyWith(editTextController: TextEditingController()));
  }
}
