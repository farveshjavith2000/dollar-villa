import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dmt_pin_screen/models/dmt_pin_model.dart';
import 'package:dollervilla/data/models/checkingTpinPost/post_checking_tpin_post_resp.dart';
import 'package:dollervilla/data/models/checkingTpinPost/post_checking_tpin_post_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
import 'package:dollervilla/data/models/dmt4FundTransferPost/post_dmt4_fund_transfer_post_resp.dart';
import 'package:dollervilla/data/models/dmt4FundTransferPost/post_dmt4_fund_transfer_post_req.dart';
part 'dmt_pin_event.dart';
part 'dmt_pin_state.dart';

/// A bloc that manages the state of a DmtPin according to the event that is dispatched to it.
class DmtPinBloc extends Bloc<DmtPinEvent, DmtPinState> {
  DmtPinBloc(DmtPinState initialState) : super(initialState) {
    on<DmtPinInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<CreateCheckingTpinEvent>(_callCheckingTpinPost);
    //on<CreateDmt4FundTransferEvent>(_callDmt4FundTransferPost);
  }

  final _repository = Repository();

  var postCheckingTpinPostResp = PostCheckingTpinPostResp();

  var postDmt4FundTransferPostResp = PostDmt4FundTransferPostResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<DmtPinState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    DmtPinInitialEvent event,
    Emitter<DmtPinState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(), isShowPassword: true));
  }

  /// Calls [https://app.victoriaepay.com/Checking_Tpin] with the provided event and emits the state.
  ///
  /// The [CreateCheckingTpinEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCheckingTpinPost(
    CreateCheckingTpinEvent event,
    Emitter<DmtPinState> emit,
  ) async {
    var postCheckingTpinPostReq = PostCheckingTpinPostReq(
      userId: PrefUtils().getMemIdForUserLoggedIn().toString(),
      tpin: state.passwordController?.text ?? '',
    );
    await _repository.checkingTpinPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postCheckingTpinPostReq.toJson(),
    ).then((value) async {
      postCheckingTpinPostResp = value;
      _onCheckingTpinPostSuccess(value, emit);
      event.onCreateCheckingTpinEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onCheckingTpinPostError();
      event.onCreateCheckingTpinEventError?.call();
    });
  }

  void _onCheckingTpinPostSuccess(
    PostCheckingTpinPostResp resp,
    Emitter<DmtPinState> emit,
  ) {
    PrefUtils().setTipcheckstatus(resp.status ?? '');
    PrefUtils().setTipcheckmessage(resp.message ?? '');
    PrefUtils().setTipcheckdetails(resp.detail ?? '');
    emit(
      state.copyWith(
        dmtPinModelObj: state.dmtPinModelObj?.copyWith(),
      ),
    );
  }

  void _onCheckingTpinPostError() {
    //implement error method body...
  }

  /// Calls [https://app.victoriaepay.com/Dmt4FundTransfer] with the provided event and emits the state.
  ///
  /// The [CreateDmt4FundTransferEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  /*FutureOr<void> _callDmt4FundTransferPost(
    CreateDmt4FundTransferEvent event,
    Emitter<DmtPinState> emit,
  ) async {
    var postDmt4FundTransferPostReq = PostDmt4FundTransferPostReq(
      mobileNumber: Constants.mobile,
      userId: PrefUtils().getMemIdForUserLoggedIn().toString(),
      name: Constants.senderName,
      recipientMobile: Constants.mobile,
      account: Constants.mobile,
      bname: Constants.senderName,
      transmode: Constants.password,
      amount: Constants.password,
      ifsc: PrefUtils().getMemIdForUserLoggedIn().toString(),
      beneName: Constants.mobile,
      recipientId: Constants.password,
      moveType: '',
      memberId: Constants.senderName,
    );
    await _repository.dmt4FundTransferPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postDmt4FundTransferPostReq.toJson(),
    ).then((value) async {


      print("Status:");
      print(value.status);
      print("Message:");
      print(value.errorMsg);
      if(value.status=="0") {
        postDmt4FundTransferPostResp = value;
        _onDmt4FundTransferPostSuccess(value, emit);
      }else{
        postDmt4FundTransferPostResp = value;
        _onDmt4FundTransferPostErrorValidate(value.msg);
      }
        // postVerifyLoginPostResp = value;
        // _onVerifyLoginPostSuccess(value, emit);
        // event.onCreateVerifyLoginEventSuccess?.call();

    }).onError((error, stackTrace) {
      //implement error call
      _onDmt4FundTransferPostError('');
    });
  }*/

  void _onDmt4FundTransferPostSuccess(
    PostDmt4FundTransferPostResp resp,
    Emitter<DmtPinState> emit,
  ) {}
  void _onDmt4FundTransferPostError(v) {
    //implement error method body...
    Fluttertoast.showToast(
        msg: 'Failed');
    NavigatorService.goBack();
  }

  void _onDmt4FundTransferPostErrorValidate(v) {
    //implement error method body...
    Fluttertoast.showToast(
        msg: v);
    //NavigatorService.goBack();
    NavigatorService.pushNamed(
      AppRoutes.beneficiarySearchScreen,
    );
  }
}
