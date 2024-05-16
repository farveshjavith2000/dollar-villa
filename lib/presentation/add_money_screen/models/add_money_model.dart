// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [add_money_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddMoneyModel extends Equatable {
  AddMoneyModel() {}

  AddMoneyModel copyWith() {
    return AddMoneyModel();
  }

  @override
  List<Object?> get props => [];
}
