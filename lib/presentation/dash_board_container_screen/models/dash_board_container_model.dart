// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'dashboardcontainer_item_model.dart';

/// This class defines the variables used in the [dash_board_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashBoardContainerModel extends Equatable {
  DashBoardContainerModel({
    this.price = "",
    this.dashboardcontainerItemList = const [],
  }) {}

  String price;

  List<DashboardcontainerItemModel> dashboardcontainerItemList;

  DashBoardContainerModel copyWith({
    String? price,
    List<DashboardcontainerItemModel>? dashboardcontainerItemList,
  }) {
    return DashBoardContainerModel(
      price: price ?? this.price,
      dashboardcontainerItemList:
      dashboardcontainerItemList ?? this.dashboardcontainerItemList,
    );
  }

  @override
  List<Object?> get props => [price, dashboardcontainerItemList];
}
