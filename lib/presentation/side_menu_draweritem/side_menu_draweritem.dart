import '../../routes/navigation_args.dart';
import 'bloc/side_menu_bloc.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SideMenuDraweritem extends StatelessWidget {
  const SideMenuDraweritem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: CustomImageView(
                  imagePath: ImageConstant.imgBiXCircleFill,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 10.h, top: 10.0))),
          Padding(
              padding: EdgeInsets.only(left: 6.h, right: 15.h),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                    height: 80.v,
                    width: 84.h,
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse39,
                          height: 80.v,
                          width: 78.h,
                          radius: BorderRadius.circular(40.h),
                          alignment: Alignment.centerRight),
                      Padding(
                          padding: EdgeInsets.only(bottom: 12.v),
                          child: CustomIconButton(
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                              padding: EdgeInsets.all(3.h),
                              decoration: IconButtonStyleHelper.fillWhiteA,
                              alignment: Alignment.bottomLeft,
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgEdit)))
                    ])),
                Padding(
                    padding:
                        EdgeInsets.only(left: 15.h, top: 17.v, bottom: 12.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_agent".tr,
                              style:
                                  CustomTextStyles.titleLargeOpenSansBlack900),
                          SizedBox(height: 2.v),
                          Text("lbl_ss_super_market".tr,
                              style:
                                  CustomTextStyles.titleSmallOpenSansBlack900)
                        ])),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgFlag,
                    height: 24.v,
                    width: 20.h,
                    margin: EdgeInsets.only(left: 5.v, top: 36.v, bottom: 20.v))
              ])),
          SizedBox(height: 49.v),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtAccountStatment(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child:Row(
                children: <Widget>[
                  CustomImageView(
                          imagePath: ImageConstant.imgIcBaselineCreditCard,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                  //SizedBox(width: 20.h,),
                   Container(
                          child: Text("lbl_fund_request".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                  Spacer(),
                 Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                ],
              ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          /*Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Row(
                children: <Widget>[
                  CustomImageView(
                      imagePath: ImageConstant.imgIcBaselineHistory,
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                  //SizedBox(width: 20.h,),
                  Container(
                      child: Text("lbl_history2".tr,
                          style: theme.textTheme.titleMedium),
                      margin:
                          EdgeInsets.only(left: 10.v, top: 20.v, bottom: 0.v)),
                  Spacer(),
                  Container(
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 24.adaptSize,
                          width: 24.adaptSize),
                      margin:
                          EdgeInsets.only(left: 5.v, top: 20.v, bottom: 0.v))
                ],
              )),
          SizedBox(
            height: 15.h,
          ),*/
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtReports(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      CustomImageView(
                          imagePath: ImageConstant.imgIcSharpReport,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                      //SizedBox(width: 20.h,),
                      Container(
                          child: Text("lbl_reports".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtChangePassword(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      //SizedBox(width: 20.h,),
                      CustomImageView(
                          imagePath: ImageConstant.imgMdiPasswordAlertOutline,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),

                      //SizedBox(width: 20.h,),

                      Container(
                          child: Text("lbl_change_password".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      //SizedBox(width: 20.h,),

                      Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtCreatePIN(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      CustomImageView(
                          imagePath: ImageConstant.imgMaterialSymbolsVpnKey,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                      //SizedBox(width: 20.h,),
                      Container(
                          child: Text("lbl_create_pin".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtPrivacyPolicy(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      CustomImageView(
                          imagePath: ImageConstant.imgBiShieldFillExclamation,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                      //SizedBox(width: 20.h,),
                      Container(
                          child: Text("lbl_privacy_policy".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    onTapTxtContactUS(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      CustomImageView(
                          imagePath: ImageConstant.imgClarityHelpSolid,
                          height: 22.adaptSize,
                          width: 22.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                      //SizedBox(width: 20.h,),
                      Container(
                          child: Text("lbl_contact_us".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 10.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      Container(
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowRight,
                              height: 24.adaptSize,
                              width: 24.adaptSize),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Row(
                children: <Widget>[
                  CustomImageView(
                      imagePath: ImageConstant.imgCloseAmber400,
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 14.h, top: 20.v)),
                  //SizedBox(width: 20.h,),
                  Container(
                      child: Text("lbl_rate_us".tr,
                          style: theme.textTheme.titleMedium),
                      margin:
                          EdgeInsets.only(left: 10.v, top: 20.v, bottom: 0.v)),
                  Spacer(),
                  Container(
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 24.adaptSize,
                          width: 24.adaptSize),
                      margin:
                          EdgeInsets.only(left: 5.v, top: 20.v, bottom: 0.v))
                ],
              )),
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Divider()),

          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: TextButton(
                  onPressed: () async {
                    if (await confirm(context,
                        title: Text("lbl_logout".tr + "?",
                            style: theme.textTheme.titleMedium),
                        content: Text("lbl_logout_message".tr,
                            style: theme.textTheme.displayLarge))) {
                      PrefUtils().setMemIdForUserLoggedIn('');
                      NavigatorService.pushNamed(
                        AppRoutes.loginPageScreen,
                      );
                      return print('pressedOK');
                    }
                    return print('pressedCancel');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: <Widget>[
                      CustomImageView(
                          imagePath: ImageConstant.img2517094161642831415,
                          height: 35.adaptSize,
                          width: 35.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10.h, top: 20.v)),
                      //SizedBox(width: 20.h,),
                      Container(
                          child: Text("lbl_logout".tr,
                              style: theme.textTheme.titleMedium),
                          margin: EdgeInsets.only(
                              left: 5.v, top: 20.v, bottom: 0.v)),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            PrefUtils().setMemIdForUserLoggedIn('');
                            NavigatorService.pushNamed(
                              AppRoutes.veifyLoginScreen,
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgArrowRight,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize),
                              margin: EdgeInsets.only(
                                  left: 20.v, top: 0.v, bottom: 0.v)))
                    ],
                  ))),
          SizedBox(
            height: 15.h,
          ),
          // Padding(padding:EdgeInsets.only(left: 10.h,right: 10.h), child:Divider()),

          // SizedBox(height: 79.v)
        ])));
  }

  /// Common widget
  Widget _buildReportsRow(
    BuildContext context, {
    required String icSharpReport,
    required String reports,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: icSharpReport, height: 22.adaptSize, width: 22.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 19.h, top: 3.v),
          child: Text(reports,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: appTheme.black900))),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Common widget
  Widget _buildLogoutRow(
    BuildContext context, {
    required String text,
    Function? onTapLogout,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(onTap: () {
        onTapLogout!.call();
      }),
      Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text(text,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: appTheme.black900))),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Navigates to the splashScreen when the action is triggered.
  onTapImgClose(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }

  /// Navigates to the reportsScreen when the action is triggered.
  onTapTxtReports(BuildContext context) {
    PrefUtils().setFilterFromDate("");
    PrefUtils().setFilterToDate("");
    PrefUtils().setFilterCustomerMobile("");
    PrefUtils().setFilterCustomerAccNo("");
    PrefUtils().setFilterCustomerTransactionId("");
    NavigatorService.pushNamed(
      AppRoutes.reportsScreen,
    );
  }

  /// Navigates to the createPinScreen when the action is triggered.
  onTapTxtCreatePIN(BuildContext context) {
    var mid = PrefUtils().getMemIdForUserLoggedIn();
    NavigatorService.pushNamed(AppRoutes.createPinScreen,
        arguments: {NavigationArgs.memId: mid});
  }

  /// Navigates to the privacyPolicyScreen when the action is triggered.
  onTapTxtPrivacyPolicy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.privacyPolicyScreen,
    );
  }

  /// Navigates to the contactUsScreen when the action is triggered.
  onTapTxtContactUS(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.contactUsScreen,
    );
  }

  /// Navigates to the contactUsScreen when the action is triggered.
  onTapTxtChangePassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.changePasswordScreen,
    );
  }

  /// Navigates to the splashScreen when the action is triggered.
  onTapImgVector(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }

  /// Navigates to the splashScreen when the action is triggered.
  onTapTxtRateUs(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtLogout(BuildContext context) {
    PrefUtils().setMemIdForUserLoggedIn("");
    NavigatorService.pushNamed(
      AppRoutes.loginPageScreen,
    );
  }

  onTapTxtAccountStatment(BuildContext context) {
    PrefUtils().setFilterFromDate("");
    PrefUtils().setFilterToDate("");
    NavigatorService.pushNamed(
      AppRoutes.myAccountStatementsDetailScreen,
    );
  }
}
