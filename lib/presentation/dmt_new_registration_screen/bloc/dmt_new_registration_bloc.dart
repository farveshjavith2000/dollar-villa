import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/models/registerDmt4Sender/post_register_dmt4_sender_req.dart';
import '../../../data/models/registerDmt4Sender/post_register_dmt4_sender_resp.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/dmt_new_registration_screen/models/dmt_new_registration_model.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'dmt_new_registration_event.dart';
part 'dmt_new_registration_state.dart';

/// A bloc that manages the state of a DmtNewRegistration according to the event that is dispatched to it.
class DmtNewRegistrationBloc
    extends Bloc<DmtNewRegistrationEvent, DmtNewRegistrationState> {
  DmtNewRegistrationBloc(DmtNewRegistrationState initialState)
      : super(initialState) {
    on<DmtNewRegistrationInitialEvent>(_onInitialize);
    on<CreateDmt4SenderRegistrationEvent>(_callRegisterDmt4Sender);
  }

  final _repository = Repository();

  var postRegisterDmt4SenderResp = PostRegisterDmt4SenderResp();

  _onInitialize(
    DmtNewRegistrationInitialEvent event,
    Emitter<DmtNewRegistrationState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        nameController1: TextEditingController(),
        otpController: TextEditingController()));
  }

  /// Calls [https://app.victoriaepay.com/Dmt4SenderRegistration] with the provided event and emits the state.
  ///
  /// The [CreateDmt4SenderRegistrationEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRegisterDmt4Sender(
    CreateDmt4SenderRegistrationEvent event,
    Emitter<DmtNewRegistrationState> emit,
  ) async {
    var postRegisterDmt4SenderReq = PostRegisterDmt4SenderReq(
      senderNumber: Constants.senderNumber,
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      senderName: state.nameController?.text ?? '',
      otp: state.otpController?.text ?? '',
      senderFName: state.nameController?.text ?? '',
      senderLName: state.nameController1?.text ?? '',
      otpsesid: 'b16a25a0-0601-4536-8e82-bd3c95ea8809',
    );
    await _repository.registerDmt4Sender(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postRegisterDmt4SenderReq.toJson(),
    ).then((value) async {


      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      if(value.status=="0") {
        postRegisterDmt4SenderResp = value;
        _onRegisterDmt4SenderSuccess(value, emit);
        event.onCreateDmt4SenderRegistrationEventSuccess?.call();
      }else{
        postRegisterDmt4SenderResp = value;
        _onRegisterDmt4SenderError();
        event.onCreateDmt4SenderRegistrationEventError?.call();
      }



    }).onError((error, stackTrace) {
      //implement error call
      _onRegisterDmt4SenderError();
      event.onCreateDmt4SenderRegistrationEventError?.call();
    });
  }

  void _onRegisterDmt4SenderSuccess(
    PostRegisterDmt4SenderResp resp,
    Emitter<DmtNewRegistrationState> emit,
  ) {
    PrefUtils().setRgstatus(resp.status ?? '');
    PrefUtils().setRgmessage(resp.message ?? '');
    PrefUtils().setRgerrormsg(resp.errorMsg ?? '');
    PrefUtils().setRgerrcode(resp.errorCode ?? '');
    PrefUtils().setRgrefcode(resp.refcode ?? 0);
    emit(
      state.copyWith(
        dmtNewRegistrationModelObj:
            state.dmtNewRegistrationModelObj?.copyWith(),
      ),
    );
  }

  void _onRegisterDmt4SenderError() {
    //implement error method body...
  }
}
