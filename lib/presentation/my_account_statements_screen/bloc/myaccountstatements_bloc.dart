import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/myaccountstatements_model.dart';
import '/core/app_export.dart';
import '../models/paymentdetails_item_model.dart';
import 'package:dollervilla/data/models/generateFunctionName/myaccount_resp.dart';
import 'package:dollervilla/data/models/generateFunctionName/post_generate_function_name_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'myaccountstatements_event.dart';
part 'myaccountstatements_state.dart';

/// A bloc that manages the state of a myaccountstatements according to the event that is dispatched to it.
class myaccountstatementsBloc extends Bloc<myaccountstatementsEvent, myaccountstatementsState> {
  myaccountstatementsBloc(myaccountstatementsState initialState) : super(initialState) {
    on<myaccountstatementsInitialEvent>(_onInitialize);
    on<CreateDmt4myaccountstatementEvent>(_callGenerateFunctionName);
  }

  final _repository = Repository();

  var postGenerateFunctionNameResp = MyAccountResp();

  /// Calls the https://app.victoriaepay.com/Dmt4myaccountstatement API and triggers a [CreateDmt4myaccountstatementEvent] event on the [myaccountstatementsBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    myaccountstatementsInitialEvent event,
    Emitter<myaccountstatementsState> emit,
  ) async {
    emit(state.copyWith(
        myaccountstatementsModelObj: state.myaccountstatementsModelObj
            ?.copyWith(paymentdetailsItemList: fillPaymentdetailsItemList())));
    add(
      CreateDmt4myaccountstatementEvent(
        onCreateDmt4myaccountstatementEventSuccess: () {
          _onGenerateFunctionNameEventSuccess();
        },
        onCreateDmt4myaccountstatementEventError: () {
          _onGenerateFunctionNameEventError();
        },
      ),
    );
  }

  List<PaymentdetailsItemModel> fillPaymentdetailsItemList() {
    return [
      PaymentdetailsItemModel(
          amount: "₹ 539",
          date: "Date : ",
          date1: "30 Oct, 2023  ",
          time: "04:09 PM",
          paymentMode: "Payment mode",
          paymentMode1: "DMT",

      ),
      PaymentdetailsItemModel(
        amount: "₹ 539",
        date: "Date : ",
        date1: "30 Oct, 2023  ",
        time: "04:09 PM",
        paymentMode: "Payment mode",
        paymentMode1: "DMT",

      )
    ];
  }

  /// Calls [https://app.victoriaepay.com/Dmt4myaccountstatement] with the provided event and emits the state.
  ///
  /// The [CreateDmt4myaccountstatementEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGenerateFunctionName(
    CreateDmt4myaccountstatementEvent event,
    Emitter<myaccountstatementsState> emit,
  ) async {

    DateTime fromdate = DateTime(DateTime.now().year, DateTime.now().month, 01);
    DateTime todate = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day);
    var fromdatestr = (PrefUtils().getFilterFromDate()!='')?PrefUtils().getFilterFromDate():fromdate.toString().substring(0, 10);
    print("From Date To String:$fromdatestr");
    var todatestr = (PrefUtils().getFilterToDate()!='')?PrefUtils().getFilterToDate():todate.toString().substring(0, 10);
    print("To Date To String:$todatestr");

    var postGenerateFunctionNameReq = PostGenerateFunctionNameReq(
      userId: PrefUtils().getMemIdForUserLoggedIn(),
      transDateStart: "$fromdatestr",
      transDateEnd: "$todatestr",
    );
    await _repository.getAccountStatement(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postGenerateFunctionNameReq.toJson(),
    ).then((value) async {
      postGenerateFunctionNameResp = value;
      _onGenerateFunctionNameSuccess(value, emit);
      event.onCreateDmt4myaccountstatementEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onGenerateFunctionNameError();
      event.onCreateDmt4myaccountstatementEventError?.call();
    });
  }

  void _onGenerateFunctionNameSuccess(
    MyAccountResp resp,
    Emitter<myaccountstatementsState> emit,
  ) {
    var paymentdetailsItemModelList = <PaymentdetailsItemModel>[];
    for (var element in resp.accsmtList ?? []) {
      var paymentdetailsItemModel = PaymentdetailsItemModel();
      paymentdetailsItemModel.date1 = element.date ?? '';
      paymentdetailsItemModel.amount = element.amount ?? '';
      paymentdetailsItemModel.paymentMode1 = element.Type ?? '';
      paymentdetailsItemModel.ClientRefId = element.ClientRefId ?? '';

      paymentdetailsItemModel.description = element.Description ?? '';
      paymentdetailsItemModel.openingbalance = element.openingbalance ?? '';
      paymentdetailsItemModel.closingbalance = element.closingbalance ?? '';
      paymentdetailsItemModel.product = element.product ?? '';
      paymentdetailsItemModelList.add(paymentdetailsItemModel);
    }
    emit(
      state.copyWith(
        myaccountstatementsModelObj: state.myaccountstatementsModelObj?.copyWith(
          paymentdetailsItemList: paymentdetailsItemModelList,
        ),
      ),
    );
  }

  void _onGenerateFunctionNameError() {
    //implement error method body...
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onGenerateFunctionNameEventSuccess() {
    Fluttertoast.showToast(
        msg: postGenerateFunctionNameResp.message.toString() ?? '');
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onGenerateFunctionNameEventError() {
    Fluttertoast.showToast(
      msg: "No Entries Found",
    );
  }
}
