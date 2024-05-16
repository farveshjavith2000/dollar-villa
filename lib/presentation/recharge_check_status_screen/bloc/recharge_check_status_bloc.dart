import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/recharge_check_status_screen/models/recharge_check_status_model.dart';
import 'package:dollervilla/data/models/rechargeCheckStatusPost/post_recharge_check_status_post_resp.dart';
import 'package:dollervilla/data/models/rechargeCheckStatusPost/post_recharge_check_status_post_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';

part 'recharge_check_status_event.dart';

part 'recharge_check_status_state.dart';

/// A bloc that manages the state of a RechargeCheckStatus according to the event that is dispatched to it.
class RechargeCheckStatusBloc
    extends Bloc<RechargeCheckStatusEvent, RechargeCheckStatusState> {
  RechargeCheckStatusBloc(RechargeCheckStatusState initialState)
      : super(initialState) {
    on<RechargeCheckStatusInitialEvent>(_onInitialize);
    on<CreateRechargecheckstatusEvent>(_callRechargeCheckStatusPost);
  }

  final _repository = Repository();

  var postRechargeCheckStatusPostResp = PostRechargeCheckStatusPostResp();

  /// Calls the https://app.victoriaepay.com/Rechargecheckstatus API and triggers a [CreateRechargecheckstatusEvent] event on the [RechargeCheckStatusBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(RechargeCheckStatusInitialEvent event,
      Emitter<RechargeCheckStatusState> emit,) async {
    add(
      CreateRechargecheckstatusEvent(),
    );
  }

  /// Calls [https://app.victoriaepay.com/Rechargecheckstatus] with the provided event and emits the state.
  ///
  /// The [CreateRechargecheckstatusEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRechargeCheckStatusPost(
      CreateRechargecheckstatusEvent event,
      Emitter<RechargeCheckStatusState> emit,) async {
    var postRechargeCheckStatusPostReq = PostRechargeCheckStatusPostReq(
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      clientId: PrefUtils().getRechargeRequestId(),
    );
    await _repository.rechargeCheckStatusPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postRechargeCheckStatusPostReq.toJson(),
    ).then((value) async {
      postRechargeCheckStatusPostResp = value;
      _onRechargeCheckStatusPostSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onRechargeCheckStatusPostError();
    });
  }

  void _onRechargeCheckStatusPostSuccess(PostRechargeCheckStatusPostResp resp,
      Emitter<RechargeCheckStatusState> emit,) {
    emit(
      state.copyWith(
        rechargeCheckStatusModelObj:
        state.rechargeCheckStatusModelObj?.copyWith(
          transID: resp.transID ?? '',
          MobileNo: resp.mobile ?? '',
          Type: resp.type ?? '',
          price: resp.transAmount ?? '',
          oct: resp.createdOn ?? '',
          ServiceProvider: resp.ServiceProvider ?? '',
          RequestID: resp.RequestID ?? '',
        ),
      ),
    );
  }

  void _onRechargeCheckStatusPostError() {
    //implement error method body...
  }
}
