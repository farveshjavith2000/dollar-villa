// ignore_for_file: must_be_immutable

part of 'dmt_new_registration_bloc.dart';

/// Represents the state of DmtNewRegistration in the application.
class DmtNewRegistrationState extends Equatable {
  DmtNewRegistrationState({
    this.nameController,
    this.nameController1,
    this.otpController,
    this.dmtNewRegistrationModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? nameController1;

  TextEditingController? otpController;

  DmtNewRegistrationModel? dmtNewRegistrationModelObj;

  @override
  List<Object?> get props => [
        nameController,
        nameController1,
        otpController,
        dmtNewRegistrationModelObj,
      ];
  DmtNewRegistrationState copyWith({
    TextEditingController? nameController,
    TextEditingController? nameController1,
    TextEditingController? otpController,
    DmtNewRegistrationModel? dmtNewRegistrationModelObj,
  }) {
    return DmtNewRegistrationState(
      nameController: nameController ?? this.nameController,
      nameController1: nameController1 ?? this.nameController1,
      otpController: otpController ?? this.otpController,
      dmtNewRegistrationModelObj:
          dmtNewRegistrationModelObj ?? this.dmtNewRegistrationModelObj,
    );
  }
}
