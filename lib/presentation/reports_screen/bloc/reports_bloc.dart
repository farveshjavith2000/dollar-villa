import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/paymentdetails_item_model.dart';
import 'package:dollervilla/presentation/reports_screen/models/reports_model.dart';
import 'package:dollervilla/data/models/generateFunctionName/report_resp.dart';
import 'package:dollervilla/data/models/generateFunctionName/post_generate_function_name_req.dart';
import 'dart:async';
import 'package:dollervilla/data/repository/repository.dart';
import 'package:dollervilla/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'reports_event.dart';

part 'reports_state.dart';

/// A bloc that manages the state of a Reports according to the event that is dispatched to it.
class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc(ReportsState initialState) : super(initialState) {
    on<ReportsInitialEvent>(_onInitialize);
    on<CreateDmt4ReportEvent>(_callGenerateFunctionName);
  }

  final _repository = Repository();

  var postGenerateFunctionNameResp = ReportResp();

  /// Calls the https://app.victoriaepay.com/Dmt4Report API and triggers a [CreateDmt4ReportEvent] event on the [ReportsBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    ReportsInitialEvent event,
    Emitter<ReportsState> emit,
  ) async {
    emit(state.copyWith(
        reportsModelObj: state.reportsModelObj
            ?.copyWith(paymentdetailsItemList: fillPaymentdetailsItemList())));
    add(
      CreateDmt4ReportEvent(
        onCreateDmt4ReportEventSuccess: () {
          _onGenerateFunctionNameEventSuccess();
        },
        onCreateDmt4ReportEventError: () {
          _onGenerateFunctionNameEventError();
        },
      ),
    );
  }

  List<ReportdetailsItemModel> fillPaymentdetailsItemList() {
    return [
      ReportdetailsItemModel(
          amount: "Loading",
          date: "Date : ",
          date1: "30 Oct, 2023  ",
          time: "04:09 PM",
          sucess: "Sucess",
          sucess1: ImageConstant.imgVectorGreen50013x13,
          paymentMode: "Loading",
          paymentMode1: "Loading",
          refNumber: "Loading",
          refNumber1: "Loading"),
      ReportdetailsItemModel(
          amount: "₹ 199",
          date: "Date : ",
          date1: "29 Oct, 2023  ",
          time: "04:00 PM",
          sucess: "Failed",
          sucess1: ImageConstant.imgVectorRed600,
          paymentMode: "Payment mode",
          paymentMode1: "UPI",
          refNumber: "Ref. number",
          refNumber1: "BROOsAJDK123")
    ];
  }

  /// Calls [https://app.victoriaepay.com/Dmt4Report] with the provided event and emits the state.
  ///
  /// The [CreateDmt4ReportEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGenerateFunctionName(
    CreateDmt4ReportEvent event,
    Emitter<ReportsState> emit,
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
      todate: "2022-12-03",
      transDateStart: "$fromdatestr",
      transDateEnd: "$todatestr",
      cusTid: PrefUtils().getFilterCustomerTransactionId(),
      cusAcc: PrefUtils().getFilterCustomerAccNo(),
      cusMobile:  PrefUtils().getFilterCustomerMobile(),
    );
    await _repository.generateFunctionName(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postGenerateFunctionNameReq.toJson(),
    ).then((value) async {
      postGenerateFunctionNameResp = value;
      _onGenerateFunctionNameSuccess(value, emit);
      event.onCreateDmt4ReportEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onGenerateFunctionNameError();
      event.onCreateDmt4ReportEventError?.call();
    });
  }

  void _onGenerateFunctionNameSuccess(
    ReportResp resp,
    Emitter<ReportsState> emit,
  ) {
    var paymentdetailsItemModelList = <ReportdetailsItemModel>[];
    for (var element in resp.accsmtList ?? []) {
      var paymentdetailsItemModel = ReportdetailsItemModel();
      paymentdetailsItemModel.date1 = element.date ?? '';
      paymentdetailsItemModel.requestid = element.RequestID ?? '';
      paymentdetailsItemModel.refNumber1 = element.txnId ?? '';
      paymentdetailsItemModel.ClientRefId = element.ClientRefId ?? '';
     paymentdetailsItemModel.BankRefId = element.BankRefId ?? '';
      paymentdetailsItemModel.Customer = element.customer ?? '';
      paymentdetailsItemModel.Beneficiary = element.beneficiary ?? '';
      paymentdetailsItemModel.ServiceCharge = element.serviceCharge ?? '';
      //paymentdetailsItemModel.Type = element.Type ?? '';
      paymentdetailsItemModel.amount = element.amount ?? '';
      paymentdetailsItemModel.sucess = element.paymentStatus ?? '';
      paymentdetailsItemModelList.add(paymentdetailsItemModel);
    }
    emit(
      state.copyWith(
        reportsModelObj: state.reportsModelObj?.copyWith(
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
