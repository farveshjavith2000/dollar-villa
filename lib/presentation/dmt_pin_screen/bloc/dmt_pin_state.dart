// ignore_for_file: must_be_immutable

part of 'dmt_pin_bloc.dart';

/// Represents the state of DmtPin in the application.
class DmtPinState extends Equatable {
  DmtPinState({
    this.passwordController,
    this.isShowPassword = true,
    this.dmtPinModelObj,
  });

  TextEditingController? passwordController;

  DmtPinModel? dmtPinModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        passwordController,
        isShowPassword,
        dmtPinModelObj,
      ];
  DmtPinState copyWith({
    TextEditingController? passwordController,
    bool? isShowPassword,
    DmtPinModel? dmtPinModelObj,
  }) {
    return DmtPinState(
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      dmtPinModelObj: dmtPinModelObj ?? this.dmtPinModelObj,
    );
  }
}
