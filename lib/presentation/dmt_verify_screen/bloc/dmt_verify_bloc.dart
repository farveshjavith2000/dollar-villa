import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/models/sendVerificationRequest/post_send_verification_request_req.dart';
import '../../../data/models/sendVerificationRequest/post_send_verification_request_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/dmt_verify_model.dart';
import '/core/app_export.dart';
import 'dart:async';
part 'dmt_verify_event.dart';
part 'dmt_verify_state.dart';

/// A bloc that manages the state of a DmtVerify according to the event that is dispatched to it.
class DmtVerifyBloc extends Bloc<DmtVerifyEvent, DmtVerifyState> {
  DmtVerifyBloc(DmtVerifyState initialState) : super(initialState) {
    on<DmtVerifyInitialEvent>(_onInitialize);
    on<CreateDmt4SenderVerificationEvent>(_callSendVerificationRequest);
  }

  final _repository = Repository();

  var postSendVerificationRequestResp = PostSendVerificationRequestResp();

  _onInitialize(
    DmtVerifyInitialEvent event,
    Emitter<DmtVerifyState> emit,
  ) async {
    emit(state.copyWith(phoneNumberController: TextEditingController()));
  }

  /// Calls [https://app.victoriaepay.com/Dmt4SenderVerification] with the provided event and emits the state.
  ///
  /// The [CreateDmt4SenderVerificationEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callSendVerificationRequest(
    CreateDmt4SenderVerificationEvent event,
    Emitter<DmtVerifyState> emit,
  ) async {
    print("Sender Number form Form");
    print(state.phoneNumberController?.text ?? '');

    PrefUtils().setSenderNumber(state.phoneNumberController?.text ?? '');
    //PrefUtils().setDMTName(Constants.dmtname);
    Constants.senderNumber=state.phoneNumberController?.text ?? '';
    var dmtname="";
    if(PrefUtils().getDMTName()=="Paysdmt"){
      dmtname="Paysdmt";
    }else{
      dmtname="";
    }
    var postSendVerificationRequestReq = PostSendVerificationRequestReq(
      senderNumber: state.phoneNumberController?.text ?? '',
      userId: PrefUtils().getMemIdForUserLoggedIn().toString(),
      dMTName: dmtname,
    );
    await _repository.sendVerificationRequest(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postSendVerificationRequestReq.toJson(),
    ).then((value) async {
      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      print("Err Message:");
      print(value.errorMsg);

      if(value.status=="0") {
        postSendVerificationRequestResp = value;
        _onSendVerificationRequestSuccess(value, emit);
        event.onCreateDmt4SenderVerificationEventSuccess?.call();
      }else{
        postSendVerificationRequestResp = value;
        _onSendVerificationRequestError();
        event.onCreateDmt4SenderVerificationEventError?.call();
      }



    }).onError((error, stackTrace) {
      //implement error call
      _onSendVerificationRequestError();
      event.onCreateDmt4SenderVerificationEventError?.call();
    });
  }

  void _onSendVerificationRequestSuccess(
    PostSendVerificationRequestResp resp,
    Emitter<DmtVerifyState> emit,
  ) {
    PrefUtils().setStatusverify(resp.status ?? '');
    PrefUtils().setMsgverify(resp.message ?? '');
    PrefUtils().setMsgerrorverify(resp.errorMsg ?? '');
    PrefUtils().setErrorCodeverify(resp.errorCode ?? '');
    PrefUtils().setErrorstateresp(resp.stateresp ?? '');
    PrefUtils().setSenderName(resp.sendername ?? '');
    PrefUtils().setSenderRemainingLimit(resp.walletbal ?? '');
    emit(
      state.copyWith(
        dmtVerifyModelObj: state.dmtVerifyModelObj?.copyWith(),
      ),
    );
  }

  void _onSendVerificationRequestError() {
    //implement error method body...
  }
}
