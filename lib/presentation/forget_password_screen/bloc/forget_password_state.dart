// ignore_for_file: must_be_immutable

part of 'forget_password_bloc.dart';

/// Represents the state of ForgetPassword in the application.
class ForgetPasswordState extends Equatable {
  ForgetPasswordState({
    this.passwordController,
    this.passwordController1,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.forgetPasswordModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  ForgetPasswordModel? forgetPasswordModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        passwordController,
        passwordController1,
        isShowPassword,
        isShowPassword1,
        forgetPasswordModelObj,
      ];
  ForgetPasswordState copyWith({
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    bool? isShowPassword,
    bool? isShowPassword1,
    ForgetPasswordModel? forgetPasswordModelObj,
  }) {
    return ForgetPasswordState(
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      forgetPasswordModelObj:
          forgetPasswordModelObj ?? this.forgetPasswordModelObj,
    );
  }
}
