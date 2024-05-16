import '../../../core/app_export.dart';

/// This class is used in the [dashboardcontainer_item_widget] screen.
class DashboardcontainerItemModel {
  DashboardcontainerItemModel({
    this.landline,
    this.landline1,
    this.id,
  }) {
    landline = landline ?? ImageConstant.imgFrame28;
    landline1 = landline1 ?? "Landline ";
    id = id ?? "";
  }

  String? landline;

  String? landline1;

  String? id;
}
