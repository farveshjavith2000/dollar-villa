// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'paymentdetails_item_model.dart';

/// This class defines the variables used in the [reports_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ReportsModel extends Equatable {
  ReportsModel({this.paymentdetailsItemList = const []}) {}

  List<ReportdetailsItemModel> paymentdetailsItemList;

  ReportsModel copyWith(
      {List<ReportdetailsItemModel>? paymentdetailsItemList}) {
    return ReportsModel(
      paymentdetailsItemList:
          paymentdetailsItemList ?? this.paymentdetailsItemList,
    );
  }

  @override
  List<Object?> get props => [paymentdetailsItemList];
}
