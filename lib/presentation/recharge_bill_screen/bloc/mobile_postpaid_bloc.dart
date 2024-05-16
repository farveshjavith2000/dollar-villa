import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/mobile_postpaid_model.dart';
import '/core/app_export.dart';
import 'package:dollervilla/data/models/mobileRechargePost/post_mobile_recharge_post_resp.dart';
import 'package:dollervilla/data/models/mobileRechargePost/post_mobile_recharge_post_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'mobile_postpaid_event.dart';
part 'mobile_postpaid_state.dart';

/// A bloc that manages the state of a MobilePostpaid according to the event that is dispatched to it.
class MobilePostpaidBloc
    extends Bloc<MobilePostpaidEvent, MobilePostpaidState> {
  MobilePostpaidBloc(MobilePostpaidState initialState) : super(initialState) {
    on<MobilePostpaidInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<CreateMobileRechargeEvent>(_callMobileRechargePost);
  }

  final _repository = Repository();

  var postMobileRechargePostResp = PostMobileRechargePostResp();

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<MobilePostpaidState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  _onInitialize(
    MobilePostpaidInitialEvent event,
    Emitter<MobilePostpaidState> emit,
  ) async {
    emit(state.copyWith(
        numbervalueController: TextEditingController(),
        amountController: TextEditingController()));
    emit(state.copyWith(
        mobilePostpaidModelObj: state.mobilePostpaidModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }

  /// Calls [https://app.victoriaepay.com/MobileRecharge] with the provided event and emits the state.
  ///
  /// The [CreateMobileRechargeEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callMobileRechargePost(
    CreateMobileRechargeEvent event,
    Emitter<MobilePostpaidState> emit,
  ) async {
    var postMobileRechargePostReq = PostMobileRechargePostReq(
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      mobile: state.numbervalueController?.text ?? '',
      operatorname: PrefUtils().getSelectOperatorName(),
      operatorid:PrefUtils().getSelectOperatorId(),
      operatortype: PrefUtils().getPage(),
      amount:  state.amountController?.text ?? '',
    );
    await _repository.mobileRechargePost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postMobileRechargePostReq.toJson(),
    ).then((value) async {


      print("Status:");
      print(value.status);
      print("Message:");
      print(value.message);
      if(value.status=="0") {
        postMobileRechargePostResp = value;
        _onMobileRechargePostSuccess(value, emit);
        event.onCreateMobileRechargeEventSuccess?.call();
      }else{
        postMobileRechargePostResp = value;
        _onMobileRechargePostError();
        event.onCreateMobileRechargeEventError?.call();
      }


      // postMobileRechargePostResp = value;
      // _onMobileRechargePostSuccess(value, emit);
      // event.onCreateMobileRechargeEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onMobileRechargePostError();
      event.onCreateMobileRechargeEventError?.call();
    });
  }

  void _onMobileRechargePostSuccess(
    PostMobileRechargePostResp resp,
    Emitter<MobilePostpaidState> emit,
  ) {
    PrefUtils().setRechargestatus(resp.status ?? '');
    PrefUtils().setRechargemessage(resp.message ?? '');
    PrefUtils().setRechargeerrorCode(resp.errorCode ?? '');
    PrefUtils().setRechargeerrorMsg(resp.errorMsg ?? '');
    emit(
      state.copyWith(
        mobilePostpaidModelObj: state.mobilePostpaidModelObj?.copyWith(),
      ),
    );
  }



  void _onMobileRechargePostError() {
    //implement error method body...
  }
}
