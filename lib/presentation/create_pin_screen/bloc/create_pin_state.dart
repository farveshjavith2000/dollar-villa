// ignore_for_file: must_be_immutable

part of 'create_pin_bloc.dart';

/// Represents the state of CreatePin in the application.
class CreatePinState extends Equatable {
  CreatePinState({
    this.passwordController,
    this.passwordController1,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.mem_id,
    this.createPinModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  CreatePinModel? createPinModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  var mem_id;

  @override
  List<Object?> get props => [
        passwordController,
        passwordController1,
        isShowPassword,
        isShowPassword1,
        mem_id,
        createPinModelObj,
      ];
  CreatePinState copyWith({
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    bool? isShowPassword,
    bool? isShowPassword1,
    var mem_id,
    CreatePinModel? createPinModelObj,
  }) {
    return CreatePinState(
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      mem_id: mem_id ?? this.mem_id,
      createPinModelObj: createPinModelObj ?? this.createPinModelObj,
    );
  }
}
