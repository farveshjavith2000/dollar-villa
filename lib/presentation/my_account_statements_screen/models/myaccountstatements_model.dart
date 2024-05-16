// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'paymentdetails_item_model.dart';

/// This class defines the variables used in the [myaccountstatements_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class myaccountstatementsModel extends Equatable {
  myaccountstatementsModel({this.paymentdetailsItemList = const []}) {}

  List<PaymentdetailsItemModel> paymentdetailsItemList;

  myaccountstatementsModel copyWith(
      {List<PaymentdetailsItemModel>? paymentdetailsItemList}) {
    return myaccountstatementsModel(
      paymentdetailsItemList:
          paymentdetailsItemList ?? this.paymentdetailsItemList,
    );
  }

  @override
  List<Object?> get props => [paymentdetailsItemList];
}
