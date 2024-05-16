import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/login_page_screen/models/login_page_model.dart';
import 'package:dollervilla/data/models/mLoginPostFunction/post_m_login_post_function_resp.dart';
import 'package:dollervilla/data/models/mLoginPostFunction/post_m_login_post_function_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
part 'login_page_event.dart';
part 'login_page_state.dart';

/// A bloc that manages the state of a LoginPage according to the event that is dispatched to it.
class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc(LoginPageState initialState) : super(initialState) {
    on<LoginPageInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<CreateMLoginEvent>(_callMLoginPostFunction);
  }

  final _repository = Repository();

  var postMLoginPostFunctionResp = PostMLoginPostFunctionResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginPageState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    LoginPageInitialEvent event,
    Emitter<LoginPageState> emit,
  ) async {
    emit(state.copyWith(
        phoneNumberController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true));
  }

  /// Calls [https://app.victoriaepay.com/mLogin] with the provided event and emits the state.
  ///
  /// The [CreateMLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callMLoginPostFunction(
    CreateMLoginEvent event,
    Emitter<LoginPageState> emit,
  ) async {
    print("phone number");
    print(state.phoneNumberController?.text ?? '');
    print("password");
    print(state.passwordController?.text ?? '');
    var postMLoginPostFunctionReq = PostMLoginPostFunctionReq(
      username: state.phoneNumberController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    await _repository.mLoginPostFunction(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postMLoginPostFunctionReq.toJson(),
    ).then((value) async {
      //print("Output: $value");
      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      if(value.status=="0") {
        postMLoginPostFunctionResp = value;
        _onMLoginPostFunctionSuccess(value, emit);
        event.onCreateMLoginEventSuccess?.call();
      }else{
        postMLoginPostFunctionResp = value;
        _onMLoginPostFunctionError(value.message);
        event.onCreateMLoginEventError?.call();
      }
    }).onError((error, stackTrace) {
      //implement error call
      _onMLoginPostFunctionError('Error');
      event.onCreateMLoginEventError?.call();
    });
  }

  void _onMLoginPostFunctionSuccess(
    PostMLoginPostFunctionResp resp,
    Emitter<LoginPageState> emit,
  ) {
    PrefUtils().setStatus(resp.status ?? '');
    PrefUtils().setMessage(resp.message ?? '');
    PrefUtils().setSessionotpid(resp.sessionOtpid ?? '');
    PrefUtils().setOtpstatus(resp.otpstatus ?? '');
    emit(
      state.copyWith(
        loginPageModelObj: state.loginPageModelObj?.copyWith(),
      ),
    );
  }

  void _onMLoginPostFunctionError(value) {
    //implement error method body...
  }
}
