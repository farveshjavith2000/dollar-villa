// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:dollervilla/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [landline_bill_payment_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LandlineBillPaymentModel extends Equatable {
  LandlineBillPaymentModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  LandlineBillPaymentModel copyWith(
      {List<SelectionPopupModel>? dropdownItemList}) {
    return LandlineBillPaymentModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
