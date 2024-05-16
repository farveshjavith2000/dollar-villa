import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.name,
    this.accountDetails,
    this.userImage,
    this.id,
    this.udf1,
    this.udf2,
    this.bankName,
    this.recipientId,
  }) {
    // userName = userName ?? "Aaditya";
    // accountDetails = accountDetails ??
    //     "A/C NO : 6558001 500017962\nICICI Bank \nCHNB0038600";
    // id = id ?? "";

    print("Bnk Name $bankName");
    name = name ?? "Aaditya";

    userImage = userImage ?? ImageConstant.imgClose;
    id = id ?? "";
    udf1 = udf1 ?? "6558001 500017962";
    udf2 = udf2 ?? "CHNB0038600";
    bankName = bankName ?? "ICICI - Chennai";
    mobileNo = mobileNo ?? "";
    recipientId= recipientId ?? "";

    accountDetails = accountDetails ??
        "A/C NO : $udf1\n$udf2\n$bankName\n";
  }

  String? name;

  String? accountDetails;

  String? userImage;

  String? id;

  String? udf1;

  String? udf2;

  String? bankName;

  String? mobileNo;

  String? recipientId;
}
