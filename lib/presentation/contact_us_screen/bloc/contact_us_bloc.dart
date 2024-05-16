import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/contact_us_screen/models/contact_us_model.dart';
import 'package:dollervilla/data/models/sendContactFormRequest/post_send_contact_form_request_resp.dart';
import 'package:dollervilla/data/models/sendContactFormRequest/post_send_contact_form_request_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
part 'contact_us_event.dart';
part 'contact_us_state.dart';

/// A bloc that manages the state of a ContactUs according to the event that is dispatched to it.
class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc(ContactUsState initialState) : super(initialState) {
    on<ContactUsInitialEvent>(_onInitialize);
    on<CreateContactEvent>(_callSendContactFormRequest);
  }

  final _repository = Repository();

  var postSendContactFormRequestResp = PostSendContactFormRequestResp();

  _onInitialize(
    ContactUsInitialEvent event,
    Emitter<ContactUsState> emit,
  ) async {}

  /// Calls [https://app.victoriaepay.com/Contact] with the provided event and emits the state.
  ///
  /// The [CreateContactEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callSendContactFormRequest(
    CreateContactEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    var postSendContactFormRequestReq = PostSendContactFormRequestReq();
    await _repository
        .sendContactFormRequest(
      requestData: postSendContactFormRequestReq.toJson(),
    )
        .then((value) async {
      postSendContactFormRequestResp = value;
      _onSendContactFormRequestSuccess(value, emit);
      event.onCreateContactEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onSendContactFormRequestError();
      event.onCreateContactEventError?.call();
    });
  }

  void _onSendContactFormRequestSuccess(
    PostSendContactFormRequestResp resp,
    Emitter<ContactUsState> emit,
  ) {
    emit(
      state.copyWith(
        contactUsModelObj: state.contactUsModelObj?.copyWith(
          weburl: resp.name ?? '',
          description: resp.address ?? '',
          widget: resp.contactno ?? '',
          email: resp.email ?? '',
        ),
      ),
    );
  }

  void _onSendContactFormRequestError() {
    //implement error method body...
  }
}
