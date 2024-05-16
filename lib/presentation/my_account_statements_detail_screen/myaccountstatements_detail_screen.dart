import 'bloc/myaccountstatements_detail_bloc.dart';
import 'models/myaccountstatements_detail_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title_image.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class myaccountstatementsDetailScreen extends StatelessWidget {
  const myaccountstatementsDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<myaccountstatementsDetailBloc>(
        create: (context) => myaccountstatementsDetailBloc(
            myaccountstatementsDetailState(myaccountstatementsDetailModelObj: myaccountstatementsDetailModel()))
          ..add(myaccountstatementsDetailInitialEvent()),
        child: myaccountstatementsDetailScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<myaccountstatementsDetailBloc, myaccountstatementsDetailState>(
        builder: (context, state) {

      return SafeArea(
          child: Scaffold(


              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white, //change your color here
                  ),
                  backgroundColor: appTheme.deepPurpleA400,
                  title:  Text( "lbl_myaccountstatement".tr,style: TextStyle(color: appTheme.white900),),
                  actions: <Widget>[]
              ),
              body: Container(
                  height: 800.v,
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 10.h, top: 22.v, right: 10.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 17.h, vertical: 29.v),
                            decoration: AppDecoration.outlineGray30002.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder23),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("₹"+PrefUtils().getViewDetailPrice(),
                                            style: CustomTextStyles.titleSmallGray80001),
                                        Container(
                                            width: 90.h,
                                            margin: EdgeInsets.only(
                                                left: (PrefUtils().getViewDetailStatus() == 'SUCCESS')?180.h:200.h, bottom: 3.v),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(PrefUtils().getViewDetailStatus(),
                                                      style: (PrefUtils().getViewDetailStatus() == 'SUCCESS')
                                                          ? CustomTextStyles.labelLargePoppinsGreen500
                                                          : CustomTextStyles.labelLargePoppinsRed500),
                                                  CustomImageView(
                                                      imagePath: (PrefUtils().getViewDetailStatus() == 'SUCCESS')
                                                          ? ImageConstant.imgVectorGreen50013x13
                                                          : ImageConstant.imgVectorRed600,
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
                                          padding: EdgeInsets.only(right: 0.h),
                                          child: Row(children: [
                                            Text("lbl_date".tr,
                                                style:
                                                theme.textTheme.bodySmall),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 11.h),
                                                child: Text(PrefUtils().getViewDetailDate(),
                                                    style: theme.textTheme.bodySmall)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 11.h),
                                                child: Text(PrefUtils().getViewDetailTime(),
                                                    style: theme.textTheme.bodySmall))
                                          ]))),
                                  SizedBox(height: 9.v),
                                  Divider(color: appTheme.gray40003),
                                  SizedBox(height: 9.v),
                                  _buildFrame(context,
                                      refNumber: "lbl_payment_mode".tr,
                                      bROOAJPSixtyNine: PrefUtils().getViewDetailMode()),
                                  SizedBox(height: 10.v),
                                  _buildFrame(context,
                                      refNumber: "lbl_ref_number".tr,
                                      bROOAJPSixtyNine: PrefUtils().getViewDetailRefNo()),
                                  SizedBox(height: 10.v)
                                ]))),
                    CustomIconButton(
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

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String refNumber,
    required String bROOAJPSixtyNine,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Text(refNumber,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.gray80001))),
      SizedBox(width: 130.h,),
      Padding(
          padding: EdgeInsets.only(left: 0.h),
          child: Text(bROOAJPSixtyNine,
              style: CustomTextStyles.titleSmallGray80001
                  .copyWith(color: appTheme.gray80001)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
