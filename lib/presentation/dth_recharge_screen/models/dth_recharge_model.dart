// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:dollervilla/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [dth_recharge_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DthRechargeModel extends Equatable {
  DthRechargeModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  DthRechargeModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return DthRechargeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
