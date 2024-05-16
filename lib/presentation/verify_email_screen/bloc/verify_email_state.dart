// ignore_for_file: must_be_immutable

part of 'verify_email_bloc.dart';

/// Represents the state of VerifyEmail in the application.
class VerifyEmailState extends Equatable {
  VerifyEmailState({
    this.editTextController,
    this.verifyEmailModelObj,
  });

  TextEditingController? editTextController;

  VerifyEmailModel? verifyEmailModelObj;

  @override
  List<Object?> get props => [
        editTextController,
        verifyEmailModelObj,
      ];
  VerifyEmailState copyWith({
    TextEditingController? editTextController,
    VerifyEmailModel? verifyEmailModelObj,
  }) {
    return VerifyEmailState(
      editTextController: editTextController ?? this.editTextController,
      verifyEmailModelObj: verifyEmailModelObj ?? this.verifyEmailModelObj,
    );
  }
}
