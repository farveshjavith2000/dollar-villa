import 'dart:ffi';

import 'package:dollervilla/presentation/reports_screen/models/paymentdetails_item_model.dart';

import '../../routes/navigation_args.dart';
import '../recharge_check_status_screen/recharge_check_status_screen.dart';
import '../recharge_check_status_screen/recharge_check_status_screen.dart';
import '../reports_screen/widgets/paymentdetails_item_widget.dart';
import 'bloc/reports_bloc.dart';

import 'models/reports_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/presentation/reports_filter_dialog/reports_filter_dialog.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({Key? key}) : super(key: key);

  DateTime now = DateTime.now();

  var mn = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ][DateTime.now().month - 1];
  var yr = DateTime.now().year.toString();

  DateTime fromdate = DateTime(DateTime.now().year, DateTime.now().month, 01);
  DateTime todate = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day);
  var fromdatestr = (PrefUtils().getFilterFromDate() != '')
      ? PrefUtils().getFilterFromDate().toString().substring(0, 10)
      : DateTime(DateTime.now().year, DateTime.now().month, 01)
          .toString()
          .substring(0, 10);

  // print("From Date To String:$fromdatestr");
  var todatestr = (PrefUtils().getFilterToDate() != '')
      ? PrefUtils().getFilterToDate().substring(0, 10)
      : DateTime(DateTime.now().year, DateTime.now().month,
              DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day)
          .toString()
          .substring(0, 10);

  //print("To Date To String:$todatestr");
  static Widget builder(BuildContext context) {
    /* var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;*/
    return BlocProvider<ReportsBloc>(
        create: (context) => ReportsBloc(ReportsState(
            reportsModelObj: ReportsModel(),
            accountnumber: "",
            transacionid: "",
            fromdate: "",
            todate: "",
            customermobile: ""))
          ..add(ReportsInitialEvent()),
        child: ReportsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title: Text(
                  "lbl_report".tr+" ("+Constants.reportFilterTypeName+")",
                  style: TextStyle(color: appTheme.white900),
                ),
                actions: <Widget>[]),
            backgroundColor: appTheme.gray100,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 846.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 38.v),
                                  decoration:
                                      AppDecoration.gradientDeepOrangeToCyan,
                                  child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        _buildFrame3(context),
                                        SizedBox(height: 33.v),
                                        _buildViewDetails(context)
                                      ])))),
                          //_buildArrowLeft(context)
                        ]))))));
  }

  /// Section Widget
  Widget _buildFrame3(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 16.v),
        decoration: AppDecoration.outlineWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBL20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //Text("$fromdate",style: TextStyle(color: Colors.black),),
          //Text("$todate",style: TextStyle(color: Colors.black),),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            /*Container(
                margin: EdgeInsets.only(right: 6.h),
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.v),
                decoration: AppDecoration.outlineGray300
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorGreen500,
                          height: 15.v,
                          width: 12.h,
                          margin: EdgeInsets.symmetric(vertical: 12.v)),
                      Padding(
                          padding: EdgeInsets.only(top: 2.v, right: 4.h),
                          child: Column(children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text("lbl_dmt_12".tr,
                                    style: CustomTextStyles
                                        .titleSmallInterGray800)),
                            SizedBox(height: 2.v),
                            Text("lbl_report".tr,
                                style: CustomTextStyles
                                    .titleSmallMontserratGray70001)
                          ]))
                    ])),*/

            TextButton(
                onPressed: () {
                  Constants.reportFilterType = "dmt1";
                  NavigatorService.pushNamed(
                    AppRoutes.reportsScreen,
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    child: _buildFrame(context,
                        vector: (Constants.reportFilterType == "dmt1")
                            ? ImageConstant.imgVectorWhiteA70001
                            : ImageConstant.imgVectorGreen500,
                        dMTCounter: "DMT 1".tr,
                        report: "lbl_report".tr,
                        active: (Constants.reportFilterType == "dmt1")
                            ? "true"
                            : "false"))),
            TextButton(
                onPressed: () {
                  Constants.reportFilterType = "dmt4";
                  Constants.reportFilterTypeName="DMT 4 Report";
                  NavigatorService.pushNamed(
                    AppRoutes.reportsScreen,
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: _buildFrame(context,
                        vector: (Constants.reportFilterType == "dmt4")
                            ? ImageConstant.imgVectorWhiteA70001
                            : ImageConstant.imgVectorGreen500,
                        dMTCounter: "DMT 4".tr,
                        report: "lbl_report".tr,
                        active: (Constants.reportFilterType == "dmt4")
                            ? "true"
                            : "false"))),
            TextButton(
                onPressed: () {
                  Constants.reportFilterType = "dmt3";
                  Constants.reportFilterTypeName="DMT 3 Report";
                  NavigatorService.pushNamed(
                    AppRoutes.reportsScreen,
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: _buildFrame(context,
                        vector: (Constants.reportFilterType == "dmt3")
                            ? ImageConstant.imgVectorWhiteA70001
                            : ImageConstant.imgVectorGreen500,
                        dMTCounter: "DMT 3".tr,
                        report: "lbl_report".tr,
                        active: (Constants.reportFilterType == "dmt3")
                            ? "true"
                            : "false")))
          ]),
          SizedBox(height: 13.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: 105.h,
                    padding: EdgeInsets.symmetric(vertical: 16.v),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (Constants.reportFilterType == "rechargerpt")
                              ? Color(0xff58ba4e)
                              : Color(0xffDBE6E9)),
                      color: (Constants.reportFilterType == "rechargerpt")
                          ? Color(0xff58ba4e)
                          : Color(0xffffffff),
                      borderRadius: BorderRadius.circular(11.h),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgVector26,
                              height: 21.v,
                              width: 12.h,
                              color:
                                  (Constants.reportFilterType == "rechargerpt")
                                      ? Color(0xffFFFFFF)
                                      : Color(0xff58ba4e),
                              margin: EdgeInsets.symmetric(vertical: 9.v)),
                          TextButton(
                              onPressed: () {
                                Constants.reportFilterType = "rechargerpt";
                                Constants.reportFilterTypeName="Recharge Report";
                                NavigatorService.pushNamed(
                                  AppRoutes.reportsScreen,
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(top: 3.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("lbl_recharge".tr,
                                            style: (Constants
                                                        .reportFilterType ==
                                                    "rechargerpt")
                                                ? CustomTextStyles
                                                    .titleSmallInterBlack900
                                                    .copyWith(
                                                        color:
                                                            appTheme.white900)
                                                : CustomTextStyles
                                                    .titleSmallInterBlack900
                                                    .copyWith(
                                                        color:
                                                            appTheme.black900)),
                                        SizedBox(height: 1.v),
                                        Padding(
                                            padding: EdgeInsets.only(left: 7.h),
                                            child: Text("lbl_report".tr,
                                                style: (Constants
                                                            .reportFilterType ==
                                                        "rechargerpt")
                                                    ? CustomTextStyles
                                                        .titleSmallInterBlack900
                                                        .copyWith(
                                                            color: appTheme
                                                                .white900)
                                                    : CustomTextStyles
                                                        .titleSmallInterBlack900
                                                        .copyWith(
                                                            color: appTheme
                                                                .black900)))
                                      ])))
                        ])),
                Container(
                    width: 110.h,
                    margin: EdgeInsets.only(left: 13.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 11.h, vertical: 16.v),
                    decoration: AppDecoration.outlineGray300.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12),
                    child: TextButton(
                        onPressed: () {
                          Constants.reportFilterType = "billpayrpt";
                          Constants.reportFilterTypeName="Bill Pay Report";
                          NavigatorService.pushNamed(
                            AppRoutes.reportsScreen,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgSolarBillCheckLinear,
                                  height: 23.v,
                                  width: 22.h,
                                  margin: EdgeInsets.symmetric(vertical: 8.v)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.h, top: 3.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text("lbl_bill_pay".tr,
                                                style: CustomTextStyles
                                                    .titleSmallInterGray800)),
                                        SizedBox(height: 1.v),
                                        Text("lbl_report".tr,
                                            style: CustomTextStyles
                                                .titleSmallMontserratGray70001)
                                      ]))
                            ]))),
                Padding(
                    padding:
                        EdgeInsets.only(left: 13.h, top: 19.v, bottom: 19.v),
                    child: CustomIconButton(
                        height: 36.adaptSize,
                        width: 36.adaptSize,
                        padding: EdgeInsets.all(9.h),
                        decoration: IconButtonStyleHelper.outlineGray,
                        onTap: () {
                          onTapBtnMiFilter(context);
                        },
                        child: CustomImageView(
                            imagePath: ImageConstant.imgMiFilter)))
              ])),
          SizedBox(height: 16.v)
        ]));
  }

  /// Section Widget
  Widget _buildViewDetails(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 18.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("From " + fromdatestr.toString() + " To " + todatestr.toString(),
              style: CustomTextStyles.titleSmallGray80001),
          SizedBox(height: 8.v),
          Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: BlocSelector<ReportsBloc, ReportsState, ReportsModel?>(
                  selector: (state) => state.reportsModelObj,
                  builder: (context, reportsModelObj) {
                    return (reportsModelObj?.paymentdetailsItemList.length == 0)
                        ? Text(
                            "no_entries_found".tr,
                            style: TextStyle(color: Colors.red),
                          )
                        : ListView.separated(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 5.0.v),
                                  child: SizedBox(
                                      width: 324.h,
                                      // child: Divider(
                                      //     height: 1.v,
                                      //     thickness: 1.v,
                                      //     color: appTheme.gray40003)
                                  ));
                            },
                            itemCount: reportsModelObj
                                    ?.paymentdetailsItemList.length ??
                                0,
                            itemBuilder: (context, index) {
                              ReportdetailsItemModel model = reportsModelObj
                                      ?.paymentdetailsItemList[index] ??
                                  ReportdetailsItemModel();
                              return ReportdetailsItemWidget(model,
                                  onTapViewDetails: () {
                                print("Bank Ref Id");
                                print(reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .BankRefId);
                                PrefUtils().setViewProduct("");
                                PrefUtils().setViewOpeningBalance("");
                                PrefUtils().setViewClosingBalance("");
                                PrefUtils().setViewDetailDescription("");
                                onTapViewDetails(
                                    context,
                                    reportsModelObj
                                        ?.paymentdetailsItemList[index]
                                        .requestid,reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .ClientRefId,reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .BankRefId,reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .Customer,reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .Beneficiary,reportsModelObj
                                    ?.paymentdetailsItemList[index]
                                    .ServiceCharge);
                              });
                            });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            decoration: AppDecoration.fillWhiteA,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
                decoration: AppDecoration.fillDeepPurpleA,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 17.v,
                          width: 10.h,
                          margin: EdgeInsets.only(bottom: 7.v),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      Padding(
                          padding: EdgeInsets.only(left: 12.h, bottom: 3.v),
                          child: Text("lbl_reports".tr,
                              style: theme.textTheme.bodyMedium))
                    ]))));
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String vector,
    required String dMTCounter,
    required String report,
    required String active,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.v),
        /* decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),*/

        decoration: BoxDecoration(
          border: Border.all(
              color:
                  (active == "true") ? Color(0xff58ba4e) : Color(0xffDBE6E9)),
          color: (active == "true") ? Color(0xff58ba4e) : Color(0xffffffff),
          borderRadius: BorderRadius.circular(11.h),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: vector,
              height: 15.v,
              width: 12.h,
              margin: EdgeInsets.symmetric(vertical: 12.v)),
          Padding(
              padding: EdgeInsets.only(left: 10.h, top: 2.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(dMTCounter,
                            style: (active == "true")
                                ? CustomTextStyles.titleSmallInterBlack900
                                    .copyWith(color: appTheme.white900)
                                : CustomTextStyles.titleSmallInterBlack900
                                    .copyWith(color: appTheme.black900))),
                    SizedBox(height: 2.v),
                    Align(
                        alignment: Alignment.center,
                        child: Text(report,
                            style: (active == "true")
                                ? CustomTextStyles.titleSmallInterBlack900
                                    .copyWith(color: appTheme.white900)
                                : CustomTextStyles.titleSmallInterBlack900
                                    .copyWith(color: appTheme.black900)))
                  ]))
        ]));
  }

  /// Navigates to the reportsDetailScreen when the action is triggered.
  onTapViewDetails(BuildContext context, requestID,ClientRefId,BankRefId,Customer,Benificiary,ServiceCharge) {
    print(BankRefId);
    PrefUtils().setViewServiceCharge(ServiceCharge);
    PrefUtils().setViewBenificiarhyId(Benificiary);
    PrefUtils().setViewCustomerRefId(Customer);
    PrefUtils().setViewBankRefId(BankRefId);
    PrefUtils().setViewClientRefId(ClientRefId);
    PrefUtils().setRechargeRequestId(requestID);
    if (Constants.reportFilterType == "rechargerpt") {
      NavigatorService.pushNamed(AppRoutes.rechargeCheckStatusScreen);
    } else {
      NavigatorService.pushNamed(AppRoutes.reportsDetailScreen);
    }
  }

  /// Displays a dialog with the [ReportsFilterDialog] content.
  onTapBtnMiFilter(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ReportsFilterDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
