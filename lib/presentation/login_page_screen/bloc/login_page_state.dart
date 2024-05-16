// ignore_for_file: must_be_immutable

part of 'login_page_bloc.dart';

/// Represents the state of LoginPage in the application.
class LoginPageState extends Equatable {
  LoginPageState({
    this.phoneNumberController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginPageModelObj,
  });

  TextEditingController? phoneNumberController;

  TextEditingController? passwordController;

  LoginPageModel? loginPageModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        phoneNumberController,
        passwordController,
        isShowPassword,
        loginPageModelObj,
      ];
  LoginPageState copyWith({
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginPageModel? loginPageModelObj,
  }) {
    return LoginPageState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginPageModelObj: loginPageModelObj ?? this.loginPageModelObj,
    );
  }
}
