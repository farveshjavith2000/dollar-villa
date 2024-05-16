import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.userName,
    this.marketName,
    this.sentCount,
    this.date,
    this.time,
    this.id,
  }) {
    userName = userName ?? "SS";
    marketName = marketName ?? "SS Market";
    sentCount = sentCount ?? "5,500 sent";
    date = date ?? "15/09/23 ";
    time = time ?? "08:25 am";
    id = id ?? "";
  }

  String? userName;

  String? marketName;

  String? sentCount;

  String? date;

  String? time;

  String? id;
}
