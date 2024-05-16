// ignore_for_file: must_be_immutable

part of 'dash_board_bloc.dart';

/// Represents the state of DashBoard in the application.
class DashBoardState extends Equatable {
  DashBoardState({
    this.radioGroup = "",
    this.dashBoardModelObj,
  });

  DashBoardModel? dashBoardModelObj;

  String radioGroup;

  @override
  List<Object?> get props => [
        radioGroup,
        dashBoardModelObj,
      ];
  DashBoardState copyWith({
    String? radioGroup,
    DashBoardModel? dashBoardModelObj,
  }) {
    return DashBoardState(
      radioGroup: radioGroup ?? this.radioGroup,
      dashBoardModelObj: dashBoardModelObj ?? this.dashBoardModelObj,
    );
  }
}
