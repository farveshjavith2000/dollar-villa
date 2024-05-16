// ignore_for_file: must_be_immutable

part of 'reports_filter_bloc.dart';

/// Represents the state of ReportsFilter in the application.
class ReportsFilterState extends Equatable {
  ReportsFilterState({
    this.mobileNumberController,
    this.enterAccountNoController,
    this.enterTIDController,
    this.reportsFilterModelObj,
  });

  TextEditingController? mobileNumberController;

  TextEditingController? enterAccountNoController;

  TextEditingController? enterTIDController;

  ReportsFilterModel? reportsFilterModelObj;

  @override
  List<Object?> get props => [
        mobileNumberController,
        enterAccountNoController,
        enterTIDController,
        reportsFilterModelObj,
      ];
  ReportsFilterState copyWith({
    TextEditingController? mobileNumberController,
    TextEditingController? enterAccountNoController,
    TextEditingController? enterTIDController,
    ReportsFilterModel? reportsFilterModelObj,
  }) {
    return ReportsFilterState(
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      enterAccountNoController:
          enterAccountNoController ?? this.enterAccountNoController,
      enterTIDController: enterTIDController ?? this.enterTIDController,
      reportsFilterModelObj:
          reportsFilterModelObj ?? this.reportsFilterModelObj,
    );
  }
}
