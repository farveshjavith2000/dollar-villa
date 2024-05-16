import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/forget_password_screen/models/forget_password_model.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

/// A bloc that manages the state of a ForgetPassword according to the event that is dispatched to it.
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc(ForgetPasswordState initialState) : super(initialState) {
    on<ForgetPasswordInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<ForgetPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    ForgetPasswordInitialEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(),
        passwordController1: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }
}
