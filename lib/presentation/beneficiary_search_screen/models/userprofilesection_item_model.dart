import '../../../core/app_export.dart';

/// This class is used in the [userprofilesection_item_widget] screen.
class UserprofilesectionItemModel {
  UserprofilesectionItemModel({
    this.aaditya,
    this.accountDetails,
    this.id,
    this.recipientId,
    this.udf1,
    this.udf2,
    this.bankName,
  }) {
    aaditya = aaditya ?? "Loading...";
    accountDetails = accountDetails ??
        "A/C NO :Loading...\nLoading... \nLoading...";
    id = id ?? "";
    recipientId = recipientId ?? "Loading...";
    udf1 = udf1 ?? "Loading...";
    udf2 = udf2 ?? "Loading...";
    bankName = bankName ?? "Loading...";
  }

  String? aaditya;

  String? accountDetails;

  String? id;

  String? recipientId;

  String? udf1;

  String? udf2;

  String? bankName;
}
