import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/add_beneficiary_screen/models/add_beneficiary_model.dart';
import 'package:dollervilla/data/models/addNewBeneficiary/post_add_new_beneficiary_resp.dart';
import 'package:dollervilla/data/models/addNewBeneficiary/post_add_new_beneficiary_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
part 'add_beneficiary_event.dart';
part 'add_beneficiary_state.dart';

/// A bloc that manages the state of a AddBeneficiary according to the event that is dispatched to it.
class AddBeneficiaryBloc
    extends Bloc<AddBeneficiaryEvent, AddBeneficiaryState> {
  AddBeneficiaryBloc(AddBeneficiaryState initialState) : super(initialState) {
    on<AddBeneficiaryInitialEvent>(_onInitialize);
    on<CreateDmt4AddNewBeneficiaryEvent>(_callAddNewBeneficiary);
  }

  final _repository = Repository();

  var postAddNewBeneficiaryResp = PostAddNewBeneficiaryResp();

  _onInitialize(
    AddBeneficiaryInitialEvent event,
    Emitter<AddBeneficiaryState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        nameController1: TextEditingController(),
        iFSCCodeController: TextEditingController(),
        enterAccountNumbervalueController: TextEditingController(),
        enterConfirmAccountNumbervalueController: TextEditingController()));
  }

  /// Calls [https://app.victoriaepay.com/Dmt4AddNewBeneficiary] with the provided event and emits the state.
  ///
  /// The [CreateDmt4AddNewBeneficiaryEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callAddNewBeneficiary(
    CreateDmt4AddNewBeneficiaryEvent event,
    Emitter<AddBeneficiaryState> emit,
  ) async {
    var postAddNewBeneficiaryReq = PostAddNewBeneficiaryReq(
      senderNumber:  PrefUtils().getSenderNumber().toString(),
      userId: PrefUtils().getMemIdForUserLoggedIn().toString(),
      senderName: state.nameController1?.text ?? '',
      accno: state.enterAccountNumbervalueController?.text ?? '',
      ifsc: state.iFSCCodeController?.text ?? '',
      bankCode:PrefUtils().getSelectBankId() ,
      channelsSupported: 'null',
      accVerAvailabe: 'null',
      ifscStatus: 'yes',
      beneName: state.nameController1?.text ?? '',
      beneMobile: PrefUtils().getSenderNumber().toString(),
      bankName: PrefUtils().getSelectBankName(),
    );
    await _repository.addNewBeneficiary(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postAddNewBeneficiaryReq.toJson(),
    ).then((value) async {

      print("Status:");
      print(value.status);
      print("Message:");
      print(value.errorMsg);
      if(value.status=="0") {
        postAddNewBeneficiaryResp = value;
        _onAddNewBeneficiarySuccess(value, emit);
        event.onCreateDmt4AddNewBeneficiaryEventSuccess?.call();
      }else{
        postAddNewBeneficiaryResp = value;
        _onAddNewBeneficiaryError();
        event.onCreateDmt4AddNewBeneficiaryEventError?.call();
      }

      postAddNewBeneficiaryResp = value;
      _onAddNewBeneficiarySuccess(value, emit);
      event.onCreateDmt4AddNewBeneficiaryEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onAddNewBeneficiaryError();
      event.onCreateDmt4AddNewBeneficiaryEventError?.call();
    });
  }

  void _onAddNewBeneficiarySuccess(
    PostAddNewBeneficiaryResp resp,
    Emitter<AddBeneficiaryState> emit,
  ) {
    PrefUtils().setAddbenstatus(resp.status ?? '');
    PrefUtils().setAddbenerrorMsg(resp.errorMsg ?? '');
    PrefUtils().setAddbenerrorCode(resp.errorCode ?? '');
    PrefUtils().setAddbenbeneid(resp.beneId ?? '');
    emit(
      state.copyWith(
        addBeneficiaryModelObj: state.addBeneficiaryModelObj?.copyWith(),
      ),
    );
  }

  void _onAddNewBeneficiaryError() {
    //implement error method body...
  }
}
