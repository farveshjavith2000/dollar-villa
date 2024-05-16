// ignore_for_file: must_be_immutable

part of 'wallet_bloc.dart';

/// Represents the state of Wallet in the application.
class WalletState extends Equatable {
  WalletState({
    this.amountController,
    this.walletModelObj,
  });

  TextEditingController? amountController;

  WalletModel? walletModelObj;

  @override
  List<Object?> get props => [
        amountController,
        walletModelObj,
      ];
  WalletState copyWith({
    TextEditingController? amountController,
    WalletModel? walletModelObj,
  }) {
    return WalletState(
      amountController: amountController ?? this.amountController,
      walletModelObj: walletModelObj ?? this.walletModelObj,
    );
  }
}
