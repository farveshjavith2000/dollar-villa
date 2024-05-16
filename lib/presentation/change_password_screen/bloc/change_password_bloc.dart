import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/change_password_screen/models/change_password_model.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

/// A bloc that manages the state of a ChangePassword according to the event that is dispatched to it.
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(ChangePasswordState initialState) : super(initialState) {
    on<ChangePasswordInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangePasswordVisibilityEvent2>(_changePasswordVisibility2);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _changePasswordVisibility2(
    ChangePasswordVisibilityEvent2 event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword2: event.value));
  }

  _onInitialize(
    ChangePasswordInitialEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(),
        passwordController1: TextEditingController(),
        passwordController2: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
        isShowPassword2: true));
  }
}
