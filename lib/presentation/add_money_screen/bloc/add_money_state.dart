// ignore_for_file: must_be_immutable

part of 'add_money_bloc.dart';

/// Represents the state of AddMoney in the application.
class AddMoneyState extends Equatable {
  AddMoneyState({
    this.amountController,
    this.addMoneyModelObj,
  });

  TextEditingController? amountController;

  AddMoneyModel? addMoneyModelObj;

  @override
  List<Object?> get props => [
        amountController,
        addMoneyModelObj,
      ];
  AddMoneyState copyWith({
    TextEditingController? amountController,
    AddMoneyModel? addMoneyModelObj,
  }) {
    return AddMoneyState(
      amountController: amountController ?? this.amountController,
      addMoneyModelObj: addMoneyModelObj ?? this.addMoneyModelObj,
    );
  }
}
