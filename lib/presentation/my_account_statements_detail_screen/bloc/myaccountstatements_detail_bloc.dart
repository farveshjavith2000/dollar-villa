import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/myaccountstatements_detail_model.dart';
import '/core/app_export.dart';
part 'myaccountstatements_detail_event.dart';
part 'myaccountstatements_detail_state.dart';

/// A bloc that manages the state of a myaccountstatementsDetail according to the event that is dispatched to it.
class myaccountstatementsDetailBloc extends Bloc<myaccountstatementsDetailEvent, myaccountstatementsDetailState> {
  myaccountstatementsDetailBloc(myaccountstatementsDetailState initialState) : super(initialState) {
    on<myaccountstatementsDetailInitialEvent>(_onInitialize);
  }

  _onInitialize(
    myaccountstatementsDetailInitialEvent event,
    Emitter<myaccountstatementsDetailState> emit,
  ) async {}
}
