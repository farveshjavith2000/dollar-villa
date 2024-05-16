// ignore_for_file: must_be_immutable

part of 'change_password_bloc.dart';

/// Represents the state of ChangePassword in the application.
class ChangePasswordState extends Equatable {
  ChangePasswordState({
    this.passwordController,
    this.passwordController1,
    this.passwordController2,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.isShowPassword2 = true,
    this.changePasswordModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  TextEditingController? passwordController2;

  ChangePasswordModel? changePasswordModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  bool isShowPassword2;

  @override
  List<Object?> get props => [
        passwordController,
        passwordController1,
        passwordController2,
        isShowPassword,
        isShowPassword1,
        isShowPassword2,
        changePasswordModelObj,
      ];
  ChangePasswordState copyWith({
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    TextEditingController? passwordController2,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? isShowPassword2,
    ChangePasswordModel? changePasswordModelObj,
  }) {
    return ChangePasswordState(
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      passwordController2: passwordController2 ?? this.passwordController2,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      isShowPassword2: isShowPassword2 ?? this.isShowPassword2,
      changePasswordModelObj:
          changePasswordModelObj ?? this.changePasswordModelObj,
    );
  }
}
