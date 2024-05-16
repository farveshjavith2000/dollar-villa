import 'bloc/reports_detail_bloc.dart';
import 'models/reports_detail_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title_image.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ReportsDetailScreen extends StatelessWidget {
  const ReportsDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportsDetailBloc>(
        create: (context) => ReportsDetailBloc(
            ReportsDetailState(reportsDetailModelObj: ReportsDetailModel()))
          ..add(ReportsDetailInitialEvent()),
        child: ReportsDetailScreen());
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey();
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<ReportsDetailBloc, ReportsDetailState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              //appBar: _buildAppBar(context),

              appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white, //change your color here
                  ),
                  backgroundColor: appTheme.deepPurpleA400,
                  title: Text(
                    "lbl_details".tr+" (Report for "+Constants.reportFilterTypeName+")",
                    style: TextStyle(color: appTheme.white900),
                  ),
                  actions: <Widget>[]),
              body: Container(
                  height: 800.v,
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: ShareScreenshotAsImage(
                            globalKey: globalKey,
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: 10.h, top: 22.v, right: 10.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 17.h, vertical: 29.v),
                                decoration: AppDecoration.outlineGray30002
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder23),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                "₹" +
                                                    PrefUtils()
                                                        .getViewDetailPrice(),
                                                style: CustomTextStyles
                                                    .titleSmallGray80001),
                                            (PrefUtils().getViewDetailStatus() !=
                                                    "")
                                                ? Container(
                                                    width: 90.h,
                                                    margin: EdgeInsets.only(
                                                        left: (PrefUtils()
                                                                    .getViewDetailStatus() ==
                                                                'SUCCESS')
                                                            ? 180.h
                                                            : 200.h,
                                                        bottom: 3.v),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              PrefUtils()
                                                                  .getViewDetailStatus(),
                                                              style: (PrefUtils()
                                                                          .getViewDetailStatus() ==
                                                                      'SUCCESS')
                                                                  ? CustomTextStyles
                                                                      .labelLargePoppinsGreen500
                                                                  : CustomTextStyles
                                                                      .labelLargePoppinsRed500),
                                                          CustomImageView(
                                                              imagePath: (PrefUtils()
                                                                          .getViewDetailStatus() ==
                                                                      'SUCCESS')
                                                                  ? ImageConstant
                                                                      .imgVectorGreen50013x13
                                                                  : ImageConstant
                                                                      .imgVectorRed600,
                                                              height:
                                                                  16.adaptSize,
                                                              width:
                                                                  16.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5.h,
                                                                      top: 4.v,
                                                                      bottom:
                                                                          4.v))
                                                        ]))
                                                : SizedBox()
                                          ]),
                                      SizedBox(height: 2.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 0.h),
                                              child: Row(children: [
                                                Expanded(
                                                    child: Text("lbl_date".tr,
                                                        style: theme.textTheme
                                                            .bodySmall)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 11.h),
                                                    child: Text(
                                                        PrefUtils()
                                                            .getViewDetailDate(),
                                                        style: CustomTextStyles
                                                            .titleSmallGray80001
                                                            .copyWith(
                                                                color: appTheme
                                                                    .gray80001))),
                                                // Padding(
                                                //     padding: EdgeInsets.only(
                                                //         left: 11.h),
                                                //     child: Text(
                                                //         PrefUtils()
                                                //             .getViewDetailTime(),
                                                //         style: CustomTextStyles.titleSmallGray80001
                                                //             .copyWith(color: appTheme.gray80001)))
                                              ]))),
                                      SizedBox(height: 9.v),
                                      Divider(color: appTheme.gray40003),
                                      SizedBox(height: 9.v),




                                      (PrefUtils().getViewProduct().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_product".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewProduct())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewProduct() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),



                                      (PrefUtils().getViewClientRefId().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_client_refid".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewClientRefId())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewClientRefId() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),



                                      (PrefUtils().getViewBankRefId().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_bank_refid".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewBankRefId())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewBankRefId() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),


                                      (PrefUtils().getViewCustomerRefId().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_customer_refid".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewCustomerRefId())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewCustomerRefId() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),


                                      (PrefUtils().getViewBenificiarhyId().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_benificiary".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewBenificiarhyId())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewBenificiarhyId() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),


                                      (PrefUtils().getViewServiceCharge().toString() !=
                                          "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_service_charge".tr,
                                          bROOAJPSixtyNine:  "₹" +PrefUtils()
                                              .getViewServiceCharge())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewServiceCharge() !=
                                          "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),


                                      (PrefUtils().getViewDetailMode() != "")
                                          ?  _buildFrame(context,
                                          refNumber: "lbl_payment_mode".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewDetailMode())
                                          :SizedBox(height: 9.v),
                                      (PrefUtils().getViewDetailMode() != "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),

                                      (PrefUtils().getViewDetailRefNo() != "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),


                                      (PrefUtils().getViewOpeningBalance() !=
                                              "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_opening_balance".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewOpeningBalance())
                                          :SizedBox(height: 9.v) ,
                                      (PrefUtils().getViewOpeningBalance() !=
                                              "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),



                                      (PrefUtils().getViewClosingBalance().toString() !=
                                              "")
                                          ? _buildFrame(context,
                                          refNumber:
                                          "lbl_closing_balance".tr,
                                          bROOAJPSixtyNine: PrefUtils()
                                              .getViewClosingBalance())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewClosingBalance() !=
                                              "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),
                                      (PrefUtils().getViewClosingBalance() !=
                                              "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox(),



                                      (PrefUtils().getViewDetailDescription() !=
                                              "")
                                          ? _buildFrameColumn(context,
                                              refNumber: "lbl_description".tr,
                                              bROOAJPSixtyNine: PrefUtils()
                                                  .getViewDetailDescription())
                                          : SizedBox(height: 9.v),
                                      (PrefUtils().getViewDetailDescription() !=
                                              "")
                                          ? SizedBox(height: 10.v)
                                          : SizedBox()
                                    ])))),
                    CustomIconButton(
                        onTap: () {
                          print("Share");
                          // shareWidgets(globalKey: globalKey);
                          //shareString( text:"Share String",  subject : 'subject');
                          shareWidgets(globalKey: globalKey);
                        },
                        height: 45.adaptSize,
                        width: 45.adaptSize,
                        padding: EdgeInsets.all(9.h),
                        decoration: IconButtonStyleHelper.outlineGrayTL22,
                        alignment: Alignment.topRight,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgSearchPrimarycontainer))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 46.v,
        centerTitle: true,
        title: Column(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgVector4),
          Padding(
              padding: EdgeInsets.only(left: 0.h, right: 300.h),
              child: Row(children: [
                AppbarTitleImage(
                    imagePath: ImageConstant.imgArrowLeft,
                    margin: EdgeInsets.only(bottom: 3.v),
                    onTap: () {
                      onTapArrowLeft(context);
                    }),
                AppbarTitle(
                    text: "lbl_reports".tr,
                    margin: EdgeInsets.only(left: 16.h, top: 1.v))
              ]))
        ]),
        styleType: Style.bgFill);
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String refNumber,
    required String bROOAJPSixtyNine,
  }) {
    return Row(children: [
      Expanded(child: Text(refNumber, style: theme.textTheme.bodySmall)),
      Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: Text(bROOAJPSixtyNine,
              style: CustomTextStyles.titleSmallGray80001
                  .copyWith(color: appTheme.gray80001))),
      // Padding(
      //     padding: EdgeInsets.only(
      //         left: 11.h),
      //     child: Text(
      //         PrefUtils()
      //             .getViewDetailTime(),
      //         style: CustomTextStyles.titleSmallGray80001
      //             .copyWith(color: appTheme.gray80001)))
    ]
        /*Row( children: [
      Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Expanded(child:Text(refNumber,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.gray80001)))),
      // SizedBox(
      //   width: 130.h,
      // ),
      Padding(
          padding: EdgeInsets.only(left: 0.h),
          child: Expanded(child:Text(bROOAJPSixtyNine,
              style: CustomTextStyles.titleSmallGray80001
                  .copyWith(color: appTheme.gray80001))))
    ]*/

        );
  }

  /// Column widget
  Widget _buildFrameColumn(
    BuildContext context, {
    required String refNumber,
    required String bROOAJPSixtyNine,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(refNumber, style: theme.textTheme.bodySmall),
      Padding(
          padding: EdgeInsets.only(left: 0.h),
          child: Text(bROOAJPSixtyNine,
              style: CustomTextStyles.titleSmallGray80001
                  .copyWith(color: appTheme.gray80001))),
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
