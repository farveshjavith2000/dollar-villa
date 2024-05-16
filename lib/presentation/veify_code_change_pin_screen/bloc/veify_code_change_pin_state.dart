// ignore_for_file: must_be_immutable

part of 'veify_code_change_pin_bloc.dart';

/// Represents the state of VeifyCodeChangePin in the application.
class VeifyCodeChangePinState extends Equatable {
  VeifyCodeChangePinState({
    this.editTextController,
    this.session_otpid,
    this.mobile,
    this.tpin,
    this.veifyCodeChangePinModelObj,
  });

  TextEditingController? editTextController;

  VeifyCodeChangePinModel? veifyCodeChangePinModelObj;

  var session_otpid;

  var mobile;

  var tpin;

  @override
  List<Object?> get props => [
        editTextController,
        session_otpid,
        mobile,
        tpin,
        veifyCodeChangePinModelObj,
      ];
  VeifyCodeChangePinState copyWith({
    TextEditingController? editTextController,
    var session_otpid,
    var mobile,
    var tpin,
    VeifyCodeChangePinModel? veifyCodeChangePinModelObj,
  }) {
    return VeifyCodeChangePinState(
      editTextController: editTextController ?? this.editTextController,
      session_otpid: session_otpid ?? this.session_otpid,
      mobile: mobile ?? this.mobile,
      tpin: tpin ?? this.tpin,
      veifyCodeChangePinModelObj:
          veifyCodeChangePinModelObj ?? this.veifyCodeChangePinModelObj,
    );
  }
}
