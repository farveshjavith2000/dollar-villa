import 'bloc/recharge_check_status_bloc.dart';
import 'models/recharge_check_status_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title_image.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class RechargeCheckStatusScreen extends StatelessWidget {
  const RechargeCheckStatusScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RechargeCheckStatusBloc>(
        create: (context) => RechargeCheckStatusBloc(RechargeCheckStatusState(
            rechargeCheckStatusModelObj: RechargeCheckStatusModel()))
          ..add(RechargeCheckStatusInitialEvent()),
        child: RechargeCheckStatusScreen());
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey();
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title: Text(
                  "lbl_details".tr +
                      " (Report for " +
                      Constants.reportFilterType +
                      ")",
                  style: TextStyle(color: appTheme.white900),
                ),
                actions: <Widget>[]),
            body: Container(
                height: 800.v,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
                child: Stack(alignment: Alignment.topRight, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: ShareScreenshotAsImage(
                          globalKey: globalKey,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 10.h, top: 22.v, right: 10.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 29.v),
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
                                          BlocSelector<
                                                  RechargeCheckStatusBloc,
                                                  RechargeCheckStatusState,
                                                  String?>(
                                              selector: (state) => state
                                                  .rechargeCheckStatusModelObj!
                                                  .price,
                                              builder: (context, price) {
                                                return Text(
                                                    "₹" + price.toString() ??
                                                        "",
                                                    style: theme
                                                        .textTheme.titleLarge);
                                              }),
                                          Container(
                                              // width: 50.h,
                                              margin: EdgeInsets.only(
                                                  left: 187.h, bottom: 3.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("lbl_sucess".tr,
                                                        style: CustomTextStyles
                                                            .titleMediumPoppinsGreen500),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorGreen50013x13,
                                                        height: 16.adaptSize,
                                                        width: 16.adaptSize,
                                                        margin: EdgeInsets.only(
                                                            left: 5.h,
                                                            top: 4.v,
                                                            bottom: 4.v))
                                                  ]))
                                        ]),
                                    SizedBox(height: 2.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 92.h),
                                            child: Row(children: [
                                              Text("lbl_date".tr,
                                                  style: CustomTextStyles
                                                      .titleSmallPoppinsGray70001),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 11.h),
                                                  child: BlocSelector<
                                                          RechargeCheckStatusBloc,
                                                          RechargeCheckStatusState,
                                                          String?>(
                                                      selector: (state) => state
                                                          .rechargeCheckStatusModelObj!
                                                          .oct,
                                                      builder: (context, oct) {
                                                        return Text(oct ?? "",
                                                            style: CustomTextStyles
                                                                .titleSmallPoppinsGray70001);
                                                      })),
                                            ]))),
                                    SizedBox(height: 9.v),
                                    Divider(color: appTheme.gray40003),
                                    SizedBox(height: 9.v),

                                    _buildFrameRow(context,
                                        refNumber: "lbl_type".tr,
                                        Type: "PayMode"),
                                    SizedBox(height: 10.v),


                                    Row( mainAxisAlignment:
                                    MainAxisAlignment.center, children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(bottom: 2.v),
                                              child: Text('lbl_mobile_no'.tr,
                                                  style: theme.textTheme.bodySmall!
                                                      .copyWith(color: appTheme.gray80001)))),
                                      Expanded(
                                          child: BlocSelector<RechargeCheckStatusBloc, RechargeCheckStatusState,
                                              String?>(
                                              selector: (state) => state.rechargeCheckStatusModelObj!.MobileNo,
                                              builder: (context, oct) {
                                                return Text(oct ?? "",
                                                    style: CustomTextStyles.titleSmallPoppinsGray70001);
                                              })
                                      )
                                    ]),
                                    SizedBox(height: 10.v),


                                    Row( mainAxisAlignment:
                                    MainAxisAlignment.center, children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(bottom: 2.v),
                                              child: Text('lbl_service_provider'.tr,
                                                  style: theme.textTheme.bodySmall!
                                                      .copyWith(color: appTheme.gray80001)))),
                                      Expanded(
                                          child: BlocSelector<RechargeCheckStatusBloc, RechargeCheckStatusState,
                                              String?>(
                                              selector: (state) => state.rechargeCheckStatusModelObj!.ServiceProvider,
                                              builder: (context, oct) {
                                                return Text(oct ?? "",
                                                    style: CustomTextStyles.titleSmallPoppinsGray70001);
                                              })
                                      )
                                    ]),
                                    SizedBox(height: 10.v),

                                    Row( mainAxisAlignment:
                                    MainAxisAlignment.center, children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(bottom: 2.v),
                                              child: Text('lbl_request_id'.tr,
                                                  style: theme.textTheme.bodySmall!
                                                      .copyWith(color: appTheme.gray80001)))),
                                      Expanded(
                                          child: BlocSelector<RechargeCheckStatusBloc, RechargeCheckStatusState,
                                              String?>(
                                              selector: (state) => state.rechargeCheckStatusModelObj!.RequestID,
                                              builder: (context, oct) {
                                                return Text(oct ?? "",
                                                    style: CustomTextStyles.titleSmallPoppinsGray70001);
                                              })
                                      )
                                    ]),
                                    SizedBox(height: 10.v),


                                    _buildFrameRow(context,
                                        refNumber: "lbl_trans_id".tr,
                                        Type: "RefNo"),
                                    SizedBox(height: 10.v),

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
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 46.v,
        centerTitle: true,
        title: Column(children: [
          AppbarTitleImage(imagePath: ImageConstant.imgVector9),
          SizedBox(height: 9.v),
          Padding(
              padding: EdgeInsets.only(left: 14.h, right: 20.h),
              child: Row(children: [
                AppbarTitleImage(
                    imagePath: ImageConstant.imgArrowLeft,
                    margin: EdgeInsets.only(bottom: 1.v),
                    onTap: () {
                      onTapArrowLeft(context);
                    }),
                AppbarTitle(
                    text: "msg_view_checked_status".tr,
                    margin: EdgeInsets.only(left: 26.h))
              ]))
        ]),
        styleType: Style.bgFill);
  }

  /// Common widget
  Widget _buildFrameRow(
    BuildContext context, {
    required String refNumber,
    required String Type,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(refNumber,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.gray80001)))),
      Expanded(
          child: BlocSelector<RechargeCheckStatusBloc, RechargeCheckStatusState,
                  String?>(
              selector: (state) => (Type == "PayMode")
                  ? state.rechargeCheckStatusModelObj!.Type
                  : state.rechargeCheckStatusModelObj!.transID,
              builder: (context, oct) {
                return Text(oct ?? "",
                    style: CustomTextStyles.titleSmallPoppinsGray70001);
              }) /*Text(Type,
              style: CustomTextStyles.titleSmallPoppinsGray80001
                  .copyWith(color: appTheme.gray80001))*/
          )
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
