// ignore_for_file: must_be_immutable

part of 'myaccountstatements_filter_bloc.dart';

/// Represents the state of myaccountstatementsFilter in the application.
class myaccountstatementsFilterState extends Equatable {
  myaccountstatementsFilterState({
    this.mobileNumberController,
    this.enterAccountNoController,
    this.enterTIDController,
    this.myaccountstatementsFilterModelObj,
  });

  TextEditingController? mobileNumberController;

  TextEditingController? enterAccountNoController;

  TextEditingController? enterTIDController;

  myaccountstatementsFilterModel? myaccountstatementsFilterModelObj;

  @override
  List<Object?> get props => [
        mobileNumberController,
        enterAccountNoController,
        enterTIDController,
        myaccountstatementsFilterModelObj,
      ];
  myaccountstatementsFilterState copyWith({
    TextEditingController? mobileNumberController,
    TextEditingController? enterAccountNoController,
    TextEditingController? enterTIDController,
    myaccountstatementsFilterModel? myaccountstatementsFilterModelObj,
  }) {
    return myaccountstatementsFilterState(
      mobileNumberController:
          mobileNumberController ?? this.mobileNumberController,
      enterAccountNoController:
          enterAccountNoController ?? this.enterAccountNoController,
      enterTIDController: enterTIDController ?? this.enterTIDController,
      myaccountstatementsFilterModelObj:
          myaccountstatementsFilterModelObj ?? this.myaccountstatementsFilterModelObj,
    );
  }
}
