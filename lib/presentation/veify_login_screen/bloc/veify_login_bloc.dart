import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/veify_login_screen/models/veify_login_model.dart';
import 'package:dollervilla/data/models/verifyLoginPost/post_verify_login_post_resp.dart';
import 'package:dollervilla/data/models/verifyLoginPost/post_verify_login_post_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'veify_login_event.dart';
part 'veify_login_state.dart';

/// A bloc that manages the state of a VeifyLogin according to the event that is dispatched to it.
class VeifyLoginBloc extends Bloc<VeifyLoginEvent, VeifyLoginState> {
  VeifyLoginBloc(VeifyLoginState initialState) : super(initialState) {
    on<VeifyLoginInitialEvent>(_onInitialize);
    on<CreateVerifyLoginEvent>(_callVerifyLoginPost);
  }

  final _repository = Repository();

  var postVerifyLoginPostResp = PostVerifyLoginPostResp();

  _onInitialize(
    VeifyLoginInitialEvent event,
    Emitter<VeifyLoginState> emit,
  ) async {
    emit(state.copyWith(editTextController: TextEditingController()));
  }

  /// Calls [https://app.victoriaepay.com/VerifyLogin] with the provided event and emits the state.
  ///
  /// The [CreateVerifyLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callVerifyLoginPost(
    CreateVerifyLoginEvent event,
    Emitter<VeifyLoginState> emit,
  ) async {
    var postVerifyLoginPostReq = PostVerifyLoginPostReq(
      username: Constants.mobile,
      password: Constants.password,
      otp: state.editTextController?.text ?? '',
      sessionOtpid: Constants.session_otpid,
    );
    await _repository.verifyLoginPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postVerifyLoginPostReq.toJson(),
    ).then((value) async {

      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      if(value.status=="0") {
        postVerifyLoginPostResp = value;
        _onVerifyLoginPostSuccess(value, emit);
        event.onCreateVerifyLoginEventSuccess?.call();
      }else{
        postVerifyLoginPostResp = value;
        _onVerifyLoginPostError();
        event.onCreateVerifyLoginEventError?.call();
      }

      //print("VerifyLoginResValue:$value");

    }).onError((error, stackTrace) {
      //implement error call
      _onVerifyLoginPostError();
      event.onCreateVerifyLoginEventError?.call();
    });
  }

  void _onVerifyLoginPostSuccess(
    PostVerifyLoginPostResp resp,
    Emitter<VeifyLoginState> emit,
  ) {
    PrefUtils().setMemIdForUserLoggedIn(resp.mem_id.toString());
    PrefUtils().setStatus(resp.status ?? '');
    PrefUtils().setMessage(resp.message ?? '');
    PrefUtils().setDetail(resp.detail ?? '');
    emit(
      state.copyWith(
        veifyLoginModelObj: state.veifyLoginModelObj?.copyWith(),
      ),
    );
  }

  void _onVerifyLoginPostError() {
    //implement error method body...
  }
}
