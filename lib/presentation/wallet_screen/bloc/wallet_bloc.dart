import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/wallet_screen/models/wallet_model.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

/// A bloc that manages the state of a Wallet according to the event that is dispatched to it.
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(WalletState initialState) : super(initialState) {
    on<WalletInitialEvent>(_onInitialize);
  }

  _onInitialize(
    WalletInitialEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(amountController: TextEditingController()));
  }
}
