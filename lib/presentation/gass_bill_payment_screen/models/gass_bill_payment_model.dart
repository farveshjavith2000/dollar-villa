// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:dollervilla/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [gass_bill_payment_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class GassBillPaymentModel extends Equatable {
  GassBillPaymentModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  GassBillPaymentModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return GassBillPaymentModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
