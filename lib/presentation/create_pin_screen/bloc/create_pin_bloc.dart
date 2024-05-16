import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/create_pin_screen/models/create_pin_model.dart';
import 'package:dollervilla/data/models/createTpin/post_create_tpin_resp.dart';
import 'package:dollervilla/data/models/createTpin/post_create_tpin_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'create_pin_event.dart';
part 'create_pin_state.dart';

/// A bloc that manages the state of a CreatePin according to the event that is dispatched to it.
class CreatePinBloc extends Bloc<CreatePinEvent, CreatePinState> {
  CreatePinBloc(CreatePinState initialState) : super(initialState) {
    on<CreatePinInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<CreateCreateTpinEvent>(_callCreateTpin);
  }

  final _repository = Repository();

  var postCreateTpinResp = PostCreateTpinResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<CreatePinState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<CreatePinState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    CreatePinInitialEvent event,
    Emitter<CreatePinState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(),
        passwordController1: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }

  /// Calls [https://app.victoriaepay.com/Create_Tpin] with the provided event and emits the state.
  ///
  /// The [CreateCreateTpinEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTpin(
    CreateCreateTpinEvent event,
    Emitter<CreatePinState> emit,
  ) async {
    var postCreateTpinReq = PostCreateTpinReq(
     // userId: PrefUtils().getMemIdForUserLoggedIn().toString(),
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      tpin: state.passwordController?.text ?? '',
    );
    await _repository.createTpin(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postCreateTpinReq.toJson(),
    ).then((value) async {

      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      print("OTP:");
      print(value.sessionOtpid);
      if(value.status=="0") {
        postCreateTpinResp = value;
        _onCreateTpinSuccess(value, emit);
        event.onCreateCreateTpinEventSuccess?.call();
      }else{
        postCreateTpinResp = value;
        _onCreateTpinError();
        event.onCreateCreateTpinEventError?.call();
      }


    }).onError((error, stackTrace) {
      //implement error call
      _onCreateTpinError();
      event.onCreateCreateTpinEventError?.call();
    });
  }

  void _onCreateTpinSuccess(
    PostCreateTpinResp resp,
    Emitter<CreatePinState> emit,
  ) {
    PrefUtils().setCreatepinsessionotpid(resp.sessionOtpid ?? '');
    PrefUtils().setCreatepinsessionotstatus(resp.otpstatus ?? '');
    PrefUtils().setCreatepintpin(resp.tpin ?? '');
    emit(
      state.copyWith(
        createPinModelObj: state.createPinModelObj?.copyWith(),
      ),
    );
  }

  void _onCreateTpinError() {
    //implement error method body...
  }
}
