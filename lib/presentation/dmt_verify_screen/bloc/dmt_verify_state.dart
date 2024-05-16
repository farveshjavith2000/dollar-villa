// ignore_for_file: must_be_immutable

part of 'dmt_verify_bloc.dart';

/// Represents the state of DmtVerify in the application.
class DmtVerifyState extends Equatable {
  DmtVerifyState({
    this.phoneNumberController,
    this.dmtVerifyModelObj,
  });

  TextEditingController? phoneNumberController;

  DmtVerifyModel? dmtVerifyModelObj;

  @override
  List<Object?> get props => [
        phoneNumberController,
        dmtVerifyModelObj,
      ];
  DmtVerifyState copyWith({
    TextEditingController? phoneNumberController,
    DmtVerifyModel? dmtVerifyModelObj,
  }) {
    return DmtVerifyState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      dmtVerifyModelObj: dmtVerifyModelObj ?? this.dmtVerifyModelObj,
    );
  }
}
