import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/privacy_policy_screen/models/privacy_policy_model.dart';
import 'package:dollervilla/data/models/sendPrivacyPostRequest/post_send_privacy_post_request_resp.dart';
import 'package:dollervilla/data/models/sendPrivacyPostRequest/post_send_privacy_post_request_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

/// A bloc that manages the state of a PrivacyPolicy according to the event that is dispatched to it.
class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  PrivacyPolicyBloc(PrivacyPolicyState initialState) : super(initialState) {
    on<PrivacyPolicyInitialEvent>(_onInitialize);
    on<CreatePrivacyEvent>(_callSendPrivacyPostRequest);
  }

  final _repository = Repository();

  var postSendPrivacyPostRequestResp = PostSendPrivacyPostRequestResp();

  _onInitialize(
    PrivacyPolicyInitialEvent event,
    Emitter<PrivacyPolicyState> emit,
  ) async {}

  /// Calls [https://app.victoriaepay.com/Privacy] with the provided event and emits the state.
  ///
  /// The [CreatePrivacyEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callSendPrivacyPostRequest(
    CreatePrivacyEvent event,
    Emitter<PrivacyPolicyState> emit,
  ) async {
    var postSendPrivacyPostRequestReq = PostSendPrivacyPostRequestReq();
    await _repository
        .sendPrivacyPostRequest(
      requestData: postSendPrivacyPostRequestReq.toJson(),
    )
        .then((value) async {
      postSendPrivacyPostRequestResp = value;
      _onSendPrivacyPostRequestSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onSendPrivacyPostRequestError();
      event.onCreatePrivacyEventError?.call();
    });
  }

  void _onSendPrivacyPostRequestSuccess(
    PostSendPrivacyPostRequestResp resp,
    Emitter<PrivacyPolicyState> emit,
  ) {
    emit(
      state.copyWith(
        privacyPolicyModelObj: state.privacyPolicyModelObj?.copyWith(
          description: resp.details ?? '',
        ),
      ),
    );
  }

  void _onSendPrivacyPostRequestError() {
    //implement error method body...
  }
}
