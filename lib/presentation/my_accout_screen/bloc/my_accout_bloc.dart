import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/my_accout_screen/models/my_accout_model.dart';
part 'my_accout_event.dart';
part 'my_accout_state.dart';

/// A bloc that manages the state of a MyAccout according to the event that is dispatched to it.
class MyAccoutBloc extends Bloc<MyAccoutEvent, MyAccoutState> {
  MyAccoutBloc(MyAccoutState initialState) : super(initialState) {
    on<MyAccoutInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MyAccoutInitialEvent event,
    Emitter<MyAccoutState> emit,
  ) async {}
}
