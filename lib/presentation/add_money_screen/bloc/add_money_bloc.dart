import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/add_money_screen/models/add_money_model.dart';
part 'add_money_event.dart';
part 'add_money_state.dart';

/// A bloc that manages the state of a AddMoney according to the event that is dispatched to it.
class AddMoneyBloc extends Bloc<AddMoneyEvent, AddMoneyState> {
  AddMoneyBloc(AddMoneyState initialState) : super(initialState) {
    on<AddMoneyInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddMoneyInitialEvent event,
    Emitter<AddMoneyState> emit,
  ) async {
    emit(state.copyWith(amountController: TextEditingController()));
  }
}
