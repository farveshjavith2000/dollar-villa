// ignore_for_file: must_be_immutable

part of 'reports_detail_bloc.dart';

/// Represents the state of ReportsDetail in the application.
class ReportsDetailState extends Equatable {
  ReportsDetailState({this.reportsDetailModelObj});

  ReportsDetailModel? reportsDetailModelObj;

  @override
  List<Object?> get props => [
        reportsDetailModelObj,
      ];
  ReportsDetailState copyWith({ReportsDetailModel? reportsDetailModelObj}) {
    return ReportsDetailState(
      reportsDetailModelObj:
          reportsDetailModelObj ?? this.reportsDetailModelObj,
    );
  }
}
