import 'bloc/verify_email_bloc.dart';
import 'models/verify_email_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<VerifyEmailBloc>(
        create: (context) => VerifyEmailBloc(
            VerifyEmailState(verifyEmailModelObj: VerifyEmailModel()))
          ..add(VerifyEmailInitialEvent()),
        child: VerifyEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "msg_create_pin_for_otp".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Container(
                width: 401.h,
                padding: EdgeInsets.only(top: 91.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLayerX00201,
                          height: 126.v,
                          width: 203.h,
                          margin: EdgeInsets.only(left: 88.h)),
                      SizedBox(height: 69.v),
                      _buildVerifyEmailFrame(context),
                      SizedBox(height: 5.v)
                    ])),
           // bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_enter_5_digit_verification".tr,
          style: TextStyle(
              color: appTheme.blue600,
              fontSize: 10.fSize,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 8.h),
          child: BlocSelector<VerifyEmailBloc, VerifyEmailState,
                  TextEditingController?>(
              selector: (state) => state.editTextController,
              builder: (context, editTextController) {
                return CustomTextFormField(
                    controller: editTextController,
                    textInputAction: TextInputAction.done,
                    borderDecoration: TextFormFieldStyleHelper.fillGray,
                    filled: true,
                    fillColor: appTheme.gray200);
              }))
    ]);
  }

  /// Section Widget
  Widget _buildVerifyEmailFrame(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 42.v),
        decoration: AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("lbl_verify_email".tr,
                  style: TextStyle(
                      color: appTheme.blue600,
                      fontSize: 16.356435775756836.fSize,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700)),
              SizedBox(height: 10.v),
              SizedBox(
                  width: 190.h,
                  child: Text("msg_verification_code".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: appTheme.blueGray400,
                          fontSize: 14.fSize,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 27.v),
              _buildEditText(context),
              SizedBox(height: 50.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("lbl_cancel".tr,
                                style: TextStyle(
                                    color: appTheme.blue600,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500)),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtConfirm(context);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 22.h),
                                    child: Text("lbl_confirm".tr,
                                        style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 15.fSize,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500))))
                          ]))),
              SizedBox(height: 8.v)
            ]));
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 129.h, right: 129.h, bottom: 8.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Container(
            height: 5.v,
            width: 142.h,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 142.h,
                      child: Divider(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1)))),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 142.h,
                      child: Divider(color: appTheme.blueGray40001)))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the dashBoardContainer1Screen when the action is triggered.
  onTapTxtConfirm(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.dashBoardContainer1Screen,
    // );
  }
}
