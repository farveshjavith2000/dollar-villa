import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/no_internet_screen/models/no_internet_model.dart';
part 'no_internet_event.dart';
part 'no_internet_state.dart';

/// A bloc that manages the state of a NoInternet according to the event that is dispatched to it.
class NoInternetBloc extends Bloc<NoInternetEvent, NoInternetState> {
  NoInternetBloc(NoInternetState initialState) : super(initialState) {
    on<NoInternetInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NoInternetInitialEvent event,
    Emitter<NoInternetState> emit,
  ) async {}
}
