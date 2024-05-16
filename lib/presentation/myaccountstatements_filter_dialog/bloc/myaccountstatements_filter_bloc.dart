import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/myaccountstatements_filter_dialog/models/myaccountstatements_filter_model.dart';
part 'myaccountstatements_filter_event.dart';
part 'myaccountstatements_filter_state.dart';

/// A bloc that manages the state of a myaccountstatementsFilter according to the event that is dispatched to it.
class myaccountstatementsFilterBloc extends Bloc<myaccountstatementsFilterEvent, myaccountstatementsFilterState> {
  myaccountstatementsFilterBloc(myaccountstatementsFilterState initialState) : super(initialState) {
    on<myaccountstatementsFilterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    myaccountstatementsFilterInitialEvent event,
    Emitter<myaccountstatementsFilterState> emit,
  ) async {
    emit(state.copyWith(
        mobileNumberController: TextEditingController(),
        enterAccountNoController: TextEditingController(),
        enterTIDController: TextEditingController()));
  }
}
