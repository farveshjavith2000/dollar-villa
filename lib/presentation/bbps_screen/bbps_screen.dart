import 'bloc/bbps_bloc.dart';
import 'models/bbps_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class BbpsScreen extends StatelessWidget {
  BbpsScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<BbpsBloc>(
        create: (context) => BbpsBloc(BbpsState(bbpsModelObj: BbpsModel()))
          ..add(BbpsInitialEvent()),
        child: BbpsScreen());
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
                title:  Text( "BBPS Payment2131".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),

            body: SizedBox(
               width: 401.h,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.h, vertical: 41.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 104.h),
                                      child: Row(children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgClose,
                                            height: 20.adaptSize,
                                            width: 20.adaptSize,
                                            onTap: () {
                                              onTapImgClose(context);
                                            }),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.h,
                                                top: 2.v,
                                                bottom: 2.v),
                                            child: Text(PrefUtils().getWalletBalance(),
                                                style: TextStyle(
                                                    color: appTheme.gray900,
                                                    fontSize: 12.fSize,
                                                    fontFamily: 'Inter',
                                                    fontWeight:
                                                        FontWeight.w700)))
                                      ]))),
                              SizedBox(height: 27.v),
                              _buildFrame(context),
                              SizedBox(height: 23.v),
                              _buildFrameSixtySeven(context),
                              SizedBox(height: 78.v),
                              CustomElevatedButton(
                                  text: "lbl_get_permium".tr,
                                  margin: EdgeInsets.only(right: 9.h),
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientIndigoAToPrimaryDecoration),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text("lbl_enter_number".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<BbpsBloc, BbpsState, TextEditingController?>(
                  selector: (state) => state.enterNumbervalueController,
                  builder: (context, enterNumbervalueController) {
                    return CustomTextFormField(
                        controller: enterNumbervalueController,
                        hintText: "lbl_number".tr,
                        textInputType: TextInputType.number,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                            child: CustomImageView(
                                imagePath: ImageConstant
                                    .imgMaterialsymbolscreditcardoutline,
                                height: 22.adaptSize,
                                width: 22.adaptSize)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v),
                        validator: (value) {
                          if (!isNumeric(value)) {
                            return "err_msg_please_enter_valid_number".tr;
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.only(
                            left: 18.h, top: 22.v, bottom: 22.v));
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySeven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("lbl_enter_email".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<BbpsBloc, BbpsState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                        controller: emailController,
                        hintText: "lbl_email_id".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 26.v, 22.h, 26.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                                height: 12.v,
                                width: 15.h)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v),
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.only(
                            left: 18.h, top: 22.v, bottom: 22.v));
                  }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
