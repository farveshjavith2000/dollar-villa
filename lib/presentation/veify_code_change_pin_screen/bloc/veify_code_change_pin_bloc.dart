import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/veify_code_change_pin_screen/models/veify_code_change_pin_model.dart';
import 'package:dollervilla/data/models/verifyTpinOtp/post_verify_tpin_otp_resp.dart';
import 'package:dollervilla/data/models/verifyTpinOtp/post_verify_tpin_otp_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'veify_code_change_pin_event.dart';
part 'veify_code_change_pin_state.dart';

/// A bloc that manages the state of a VeifyCodeChangePin according to the event that is dispatched to it.
class VeifyCodeChangePinBloc
    extends Bloc<VeifyCodeChangePinEvent, VeifyCodeChangePinState> {
  VeifyCodeChangePinBloc(VeifyCodeChangePinState initialState)
      : super(initialState) {
    on<VeifyCodeChangePinInitialEvent>(_onInitialize);
    on<CreateVerifyTpinotpEvent>(_callVerifyTpinOtp);
  }

  final _repository = Repository();

  var postVerifyTpinOtpResp = PostVerifyTpinOtpResp();

  _onInitialize(
    VeifyCodeChangePinInitialEvent event,
    Emitter<VeifyCodeChangePinState> emit,
  ) async {
    emit(state.copyWith(editTextController: TextEditingController()));
  }

  /// Calls [https://app.victoriaepay.com/VerifyTpinotp] with the provided event and emits the state.
  ///
  /// The [CreateVerifyTpinotpEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callVerifyTpinOtp(
    CreateVerifyTpinotpEvent event,
    Emitter<VeifyCodeChangePinState> emit,
  ) async {
   // print(state.editTextController)
    var postVerifyTpinOtpReq = PostVerifyTpinOtpReq(
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      tpin: PrefUtils().getCreatepintpin(),
      otp: state.editTextController?.text ?? '',
      sessionOtpid: PrefUtils().getCreatepinsessionotpid(),
    );
    await _repository.verifyTpinOtp(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postVerifyTpinOtpReq.toJson(),
    ).then((value) async {

      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      print("Detail:");
      print(value.detail);
      if(value.status=="0") {
        postVerifyTpinOtpResp = value;
        _onVerifyTpinOtpSuccess(value, emit);
        event.onCreateVerifyTpinotpEventSuccess?.call();
      }else{
        postVerifyTpinOtpResp = value;
        _onVerifyTpinOtpError();
        event.onCreateVerifyTpinotpEventError?.call();
      }


    }).onError((error, stackTrace) {
      //implement error call
      _onVerifyTpinOtpError();
      event.onCreateVerifyTpinotpEventError?.call();
    });
  }

  void _onVerifyTpinOtpSuccess(
    PostVerifyTpinOtpResp resp,
    Emitter<VeifyCodeChangePinState> emit,
  ) {
    PrefUtils().setChangepinstatus(resp.status ?? '');
    PrefUtils().setChangepinmessage(resp.message ?? '');
    PrefUtils().setChangepinotpstatus(resp.oTPStatus ?? '');
    PrefUtils().setChangepinotpdetail(resp.oTPDetail ?? '');
    PrefUtils().setChangepindetail(resp.detail ?? '');
    emit(
      state.copyWith(
        veifyCodeChangePinModelObj:
            state.veifyCodeChangePinModelObj?.copyWith(),
      ),
    );
  }

  void _onVerifyTpinOtpError() {
    //implement error method body...
  }
}
