import '../../../core/app_export.dart';

/// This class is used in the [paymentdetails_item_widget] screen.
class PaymentdetailsItemModel {
  PaymentdetailsItemModel({
    this.amount,
    this.date,
    this.date1,
    this.time,
    this.paymentMode,
    this.paymentMode1,

    this.id,
    this.description,
    this.openingbalance,
    this.closingbalance,
    this.ClientRefId,
    this.product
  }) {
    amount = amount ?? "Loading...";
    date = date ?? "Date :";
    date1 = date1 ?? "Loading...";
    time = time ?? "";
    paymentMode = paymentMode ?? "Payment Mode";
    paymentMode1 = paymentMode1 ?? "Loading...";
    description = description ?? "Loading...";
    openingbalance=openingbalance ?? "Loading...";
    closingbalance=closingbalance ?? "Loading...";
    id = id ?? "";
    ClientRefId = ClientRefId ?? "fgfgfg";
    product = product ?? "fgfgfg";
  }

  String? amount;

  String? date;

  String? date1;

  String? time;

  String? paymentMode;

  String? paymentMode1;

  String? id;

  String? description;

  String?openingbalance;
  String?closingbalance;
  String?ClientRefId;
  String?product;
}
