import '../../routes/navigation_args.dart';
import '../dash_board_container_screen/bloc/dash_board_container_bloc.dart';
import '../dmt_verify_screen/dmt_verify_screen.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'bloc/dash_board_bloc.dart';
import 'models/dash_board_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DashBoardBloc>(
        create: (context) =>
            DashBoardBloc(DashBoardState(dashBoardModelObj: DashBoardModel()))
              ..add(DashBoardInitialEvent()),
        child: DashBoardPage());
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: SideMenuDraweritem(),
            backgroundColor: appTheme.deepPurple50,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillDeepPurple,
                child: SingleChildScrollView(
                    child: Column(children: [
                  _AppBar(context, _scaffoldKey),
                  SizedBox(height: 7.v),
                  _buildFrame(context),
                  SizedBox(height: 8.v),
                  _buildFrame1(context),
                  SizedBox(height: 18.v),
                  _buildFrame2(context),
                  SizedBox(height: 5.v)
                ])))));
  }

  /// Section Widget
  Widget _AppBar(BuildContext context, _scaffoldKey) {
    return SizedBox(
        height: 86.v,
        width: 413.h,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 19.v),
            decoration: AppDecoration.fillWhiteA
                .copyWith(borderRadius: BorderRadiusStyle.customBorderBL12),
            child: Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.appBarProfile,
                      height: 53.v,
                      // width: 52.h,
                      alignment: Alignment.topRight,
                      //margin: EdgeInsets.only(top: 0.v, right: 0.h)
                    )),
                SizedBox(
                  width: 20.h,
                ),
                CustomImageView(
                    imagePath: ImageConstant.appBarTitle,
                    height: 47.v,
                    width: 183.h,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 0.v, right: 0.h)),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          print("Notification clicked");
                          NavigatorService.pushNamed(
                            AppRoutes.notificationScreen,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgFlag,
                            height: 24.v,
                            width: 20.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 0.v, right: 17.h))))
              ],
            )));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5.h, right: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 19.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgFrame178,
                  height: 18.adaptSize,
                  width: 18.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text("msg_aeps_bal_750_0".tr,
                      style: CustomTextStyles.labelLargeInterBlack900)),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.img_wallet_balance,
                  height: 18.adaptSize,
                  width: 18.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text("msg_balance_wallet".tr,
                      style: CustomTextStyles.labelLargeInterBlack900)),
              BlocSelector<DashBoardBloc, DashBoardState, String?>(
                  selector: (state) => state.radioGroup,
                  builder: (context, radioGroup) {
                    return BlocSelector<DashBoardContainerBloc,
                            DashBoardContainerState, String?>(
                        selector: (state) =>
                            state.dashBoardContainerModelObj!.price,
                        builder: (context, price) {
                          PrefUtils().setWalletBalance(
                              "Balance : " + price.toString());
                          return Text(price ?? "Balance",
                              style: CustomTextStyles.labelLargeInterBlack900);
                        });
                  })
            ]));
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 13.h, right: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 21.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextButton(
                  onPressed: () async {
                    // Constants.dmtname = "";
                    PrefUtils().setDMTName("");
                    NavigatorService.pushNamed(
                      AppRoutes.myAccountStatementsDetailScreen,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_money_transfer2".tr,
                            style: CustomTextStyles.titleSmallInterOnPrimary),
                        Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: Text("lbl_my_transaction".tr,
                                style: CustomTextStyles
                                    .labelLargeRalewayDeeppurpleA400))
                      ]))),
          SizedBox(height: 14.v),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 37.v),
              decoration: AppDecoration.gradientIndigoAToPurpleA
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder26),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          onTapFrame(context);
                        },
                        child: TextButton(
                            onPressed: () async {
                              // Constants.dmtname = "";
                              PrefUtils().setDMTName("");
                              NavigatorService.pushNamed(
                                AppRoutes.dmtVerifyScreen,
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(top: 3.v, bottom: 4.v),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgFrame189,
                                      height: 36.v,
                                      width: 55.h),
                                  SizedBox(height: 19.v),
                                  Text("lbl_dmt_1".tr,
                                      style: CustomTextStyles.titleSmallInter)
                                ])))),
                    TextButton(
                        onPressed: () async {
                          //Constants.dmtname = "Paysdmt";
                          PrefUtils().setDMTName("Paysdmt");
                          NavigatorService.pushNamed(
                            AppRoutes.dmtVerifyScreen,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 4.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgDmnt3,
                                      height: 43.v,
                                      width: 51.h,
                                      alignment: Alignment.center),
                                  SizedBox(height: 15.v),
                                  Text("lbl_dmt_2".tr,
                                      style: CustomTextStyles.titleSmallInter)
                                ]))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 4.v),
                        child: Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFrame190,
                              height: 42.v,
                              width: 53.h),
                          SizedBox(height: 16.v),
                          Text("lbl_dmt_3".tr,
                              style: CustomTextStyles.titleSmallInter)
                        ])),
                    Padding(
                        padding: EdgeInsets.only(right: 4.h, bottom: 3.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCreditCardPay,
                                  height: 50.v,
                                  width: 50.h,
                                  alignment: Alignment.centerRight,
                                  margin:
                                      EdgeInsets.only(right: 1.h, left: 15.h)),
                              SizedBox(height: 0.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "lbl_creditcardpay".tr,
                                    style: CustomTextStyles.titleSmallInter,
                                    textAlign: TextAlign.center,
                                  ))
                            ]))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildFrame2(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 35.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              child: TextButton(
                  onPressed: () async {
                    // Constants.dmtname = "";
                    PrefUtils().setDMTName("");
                    Constants.reportFilterType = "rechargerpt";
                    NavigatorService.pushNamed(
                      AppRoutes.reportsScreen,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("lbl_recharge_bill".tr,
                        style: CustomTextStyles.titleSmallInterLightblue900),
                    Text("lbl_my_bill".tr,
                        style: CustomTextStyles.titleSmallRalewayDeeppurpleA400)
                  ]))),
          SizedBox(height: 11.v),
          Divider(color: appTheme.blue200, indent: 11.h),
          SizedBox(height: 14.v),
          Padding(
              padding: EdgeInsets.only(left: 18.h, right: 9.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 4.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('lbl_mobile_postpaid');
                              dthRechargeNavigation(
                                  context, 'lbl_mobile_postpaid');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgMobile,
                                  height: 56.v,
                                  width: 58.h),
                              Text("lbl_mobile".tr,
                                  style:
                                      CustomTextStyles.bodyMediumInterGray800)
                            ]))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 3.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('lbl_dth_recharge');
                              dthRechargeNavigation(
                                  context, 'lbl_dth_recharge');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgCar,
                                      height: 56.v,
                                      width: 57.h),
                                  Padding(
                                      padding: EdgeInsets.only(left: 12.h),
                                      child: Text("lbl_dth".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInterGray800))
                                ]))),
                    Padding(
                        padding: EdgeInsets.only(top: 10.v, bottom: 2.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('msg_landline_bill_payment');
                              dthRechargeNavigation(
                                  context, 'msg_landline_bill_payment');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgFrame28,
                                  height: 38.v,
                                  width: 45.h),
                              SizedBox(height: 8.v),
                              Text("lbl_landline".tr,
                                  style:
                                      CustomTextStyles.bodyMediumInterGray800)
                            ]))),
                    TextButton(
                        onPressed: () {
                          PrefUtils().setPage('msg_broadband_bill_payment');
                          dthRechargeNavigation(
                              context, 'msg_broadband_bill_payment');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCarBlue900,
                              height: 54.v,
                              width: 61.h,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 4.h)),
                          SizedBox(height: 5.v),
                          Text("lbl_broadband".tr,
                              style: CustomTextStyles.bodyMediumInterGray800)
                        ]))
                  ])),
          SizedBox(height: 20.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('lbl_bbps_payment');
                              dthRechargeNavigation(
                                  context, 'lbl_bbps_payment');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgFrame23,
                                      height: 54.v,
                                      width: 62.h),
                                  SizedBox(height: 7.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 9.h),
                                      child: Text("lbl_bbps".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInterGray800))
                                ]))),
                    Spacer(flex: 35),
                    Padding(
                        padding: EdgeInsets.only(top: 14.v, bottom: 5.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('msg_electricity_bill');
                              dthRechargeNavigation(
                                  context, 'msg_electricity_bill');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgAirplane,
                                  height: 34.v,
                                  width: 35.h),
                              SizedBox(height: 12.v),
                              Text("lbl_electric".tr,
                                  style:
                                      CustomTextStyles.bodyMediumInterGray800)
                            ]))),
                    Spacer(flex: 34),
                    TextButton(
                        onPressed: () {
                          PrefUtils().setPage('msg_gas_bill');
                          dthRechargeNavigation(context, 'msg_gas_bill');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Column(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgLocation,
                              height: 55.v,
                              width: 61.h),
                          SizedBox(height: 11.v),
                          Text("lbl_gass".tr,
                              style: CustomTextStyles.bodyMediumInterGray800)
                        ])),
                    Spacer(flex: 29),
                    Padding(
                        padding: EdgeInsets.only(top: 17.v, bottom: 2.v),
                        child: TextButton(
                            onPressed: () {
                              PrefUtils().setPage('lbl_fastag_bill');
                              dthRechargeNavigation(context, 'lbl_fastag_bill');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgFastagLogo1,
                                  height: 29.v,
                                  width: 54.h),
                              SizedBox(height: 17.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 2.h),
                                      child: Text("lbl_fastag".tr,
                                          style: CustomTextStyles
                                              .bodyMediumInterGray800)))
                            ])))
                  ])),
          SizedBox(height: 9.v)
        ]));
  }

  /// Navigates to the dmtVerifyScreen when the action is triggered.
  onTapFrame(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dmtVerifyScreen,
    );
  }

  dthRechargeNavigation(BuildContext context, page) {
    NavigatorService.pushNamed(AppRoutes.mobilePostpaidScreen,
        arguments: {NavigationArgs.page: page});
  }
}
