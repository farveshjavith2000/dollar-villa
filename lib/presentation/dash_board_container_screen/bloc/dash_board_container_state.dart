// ignore_for_file: must_be_immutable

part of 'dash_board_container_bloc.dart';

/// Represents the state of DashBoardContainer in the application.
class DashBoardContainerState extends Equatable {
  DashBoardContainerState({
    this.radioGroup = "",
    this.dashBoardContainerModelObj,
  });

  DashBoardContainerModel? dashBoardContainerModelObj;

  String radioGroup;

  @override
  List<Object?> get props => [
    radioGroup,
    dashBoardContainerModelObj,
  ];
  DashBoardContainerState copyWith({
    String? radioGroup,
    DashBoardContainerModel? dashBoardContainerModelObj,
  }) {
    return DashBoardContainerState(
      radioGroup: radioGroup ?? this.radioGroup,
      dashBoardContainerModelObj:
      dashBoardContainerModelObj ?? this.dashBoardContainerModelObj,
    );
  }
}
