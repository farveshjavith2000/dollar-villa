import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofilesection_item_model.dart';
import 'package:dollervilla/presentation/beneficiary_search_screen/models/beneficiary_search_model.dart';
import 'package:dollervilla/data/models/deleteBeneficiary/post_delete_beneficiary_resp.dart';
import 'package:dollervilla/data/models/deleteBeneficiary/post_delete_beneficiary_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
import 'package:dollervilla/data/models/getRecipientsList/post_get_recipients_list_resp.dart';
import 'package:dollervilla/data/models/getRecipientsList/post_get_recipients_list_req.dart';
part 'beneficiary_search_event.dart';
part 'beneficiary_search_state.dart';

/// A bloc that manages the state of a BeneficiarySearch according to the event that is dispatched to it.

// ignore_for_file: must_be_immutable
class BeneficiarySearchBloc
    extends Bloc<BeneficiarySearchEvent, BeneficiarySearchState> {
  BeneficiarySearchBloc(BeneficiarySearchState initialState)
      : super(initialState) {
    on<BeneficiarySearchInitialEvent>(_onInitialize);
    on<CreateDmt4DeleteBeneficiaryEvent>(_callDeleteBeneficiary);
    on<CreateDmt4GetRecipientsListEvent>(_callGetRecipientsList);
  }

  final _repository = Repository();

  var postDeleteBeneficiaryResp = PostDeleteBeneficiaryResp();

  var postGetRecipientsListResp = PostGetRecipientsListResp();

  List<UserprofilesectionItemModel> fillUserprofilesectionItemList() {
    return [
      UserprofilesectionItemModel(
          aaditya: "Loading",
          accountDetails:
              "A/C NO : Loading")
    ];
  }

  /// Calls the https://app.victoriaepay.com/Dmt4GetRecipientsList API and triggers a [CreateDmt4GetRecipientsListEvent] event on the [BeneficiarySearchBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    BeneficiarySearchInitialEvent event,
    Emitter<BeneficiarySearchState> emit,
  ) async {
    print("Initalize Search");
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        beneficiarySearchModelObj: state.beneficiarySearchModelObj?.copyWith(
            userprofilesectionItemList: fillUserprofilesectionItemList())));
    add(
      CreateDmt4GetRecipientsListEvent(),
    );
  }

  /// Calls [https://app.victoriaepay.com/Dmt4DeleteBeneficiary] with the provided event and emits the state.
  ///
  /// The [CreateDmt4DeleteBeneficiaryEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callDeleteBeneficiary(
    CreateDmt4DeleteBeneficiaryEvent event,
    Emitter<BeneficiarySearchState> emit,
  ) async {
    var postDeleteBeneficiaryReq = PostDeleteBeneficiaryReq(
        mobile: PrefUtils().getSenderNumber(),
        userId:PrefUtils().getMemIdForUserLoggedIn(),
        senderName: PrefUtils().getSenderName(),
        beneficiaryID: PrefUtils().getBenIdForDelete());
    await _repository.deleteBeneficiary(
        headers: {'Content-type': 'application/json'},
        requestData: postDeleteBeneficiaryReq.toJson()).then((value) async {
      postDeleteBeneficiaryResp = value;
      _onDeleteBeneficiarySuccess(value, emit);
    }).onError((error, stackTrace) {
      _onDeleteBeneficiaryError();
    });
  }

  void _onDeleteBeneficiarySuccess(
    PostDeleteBeneficiaryResp resp,
    Emitter<BeneficiarySearchState> emit,
  ) {

    PrefUtils().setDeletestatus(resp.status ?? '');
    PrefUtils().setDeletemessage(resp.message ?? '');
    PrefUtils().setDeleteerrorMsg(resp.errorMsg ?? '');
    PrefUtils().setDeleteerrorCode(resp.errorCode ?? '');
    // emit(state.copyWith(
    //     userprofilesectionItemModelObj:
    //         state.userprofilesectionItemModelObj?.copyWith()));
  }

  void _onDeleteBeneficiaryError() {}

  /// Calls [https://app.victoriaepay.com/Dmt4GetRecipientsList] with the provided event and emits the state.
  ///
  /// The [CreateDmt4GetRecipientsListEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGetRecipientsList(
    CreateDmt4GetRecipientsListEvent event,
    Emitter<BeneficiarySearchState> emit,
  ) async {
    var postGetRecipientsListReq = PostGetRecipientsListReq(
      senderNumber: Constants.senderNumber,
      userId: Constants.memId.toString(),
      senderName: Constants.senderName,
      dMTName: PrefUtils().getDMTName(),
    );
    await _repository.getRecipientsList(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postGetRecipientsListReq.toJson(),
    ).then((value) async {
      postGetRecipientsListResp = value;
      _onGetRecipientsListSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onGetRecipientsListError();
    });
  }

  void _onGetRecipientsListSuccess(
    PostGetRecipientsListResp resp,
    Emitter<BeneficiarySearchState> emit,
  ) {
    var userprofilesectionItemModelList = <UserprofilesectionItemModel>[];
    for (var element in resp.data ?? []) {
      var userprofilesectionItemModel = UserprofilesectionItemModel();
      userprofilesectionItemModel.recipientId = element.beneId ?? '';
      userprofilesectionItemModel.aaditya = element.name ?? '';
      userprofilesectionItemModel.udf1 = element.accno ?? '';
      userprofilesectionItemModel.udf2 = element.ifsc ?? '';
      userprofilesectionItemModel.bankName = element.bankname ?? '';
      userprofilesectionItemModel.bankName = element.bankname ?? '';
      userprofilesectionItemModelList.add(userprofilesectionItemModel);
    }
    emit(
      state.copyWith(
        beneficiarySearchModelObj: state.beneficiarySearchModelObj?.copyWith(
          userprofilesectionItemList: userprofilesectionItemModelList,
        ),
      ),
    );
  }

  void _onGetRecipientsListError() {
    //implement error method body...
  }
}
