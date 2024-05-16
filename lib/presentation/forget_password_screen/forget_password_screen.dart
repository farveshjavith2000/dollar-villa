import 'bloc/forget_password_bloc.dart';
import 'models/forget_password_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgetPasswordBloc>(
        create: (context) => ForgetPasswordBloc(
            ForgetPasswordState(forgetPasswordModelObj: ForgetPasswordModel()))
          ..add(ForgetPasswordInitialEvent()),
        child: ForgetPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_forget_password".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: SizedBox(
                width: 200.h,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              Spacer(flex: 33),
                              CustomImageView(
                                  imagePath: ImageConstant.imgVector2,
                                  height: 1.v,
                                  width: 414.h),
                              _buildFrame(context),
                              Spacer(flex: 27),
                              CustomElevatedButton(
                                  text: "lbl_send".tr,
                                  margin:
                                      EdgeInsets.only(left: 31.h, right: 35.h),
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientIndigoAToPrimaryDecoration),
                              Spacer(flex: 39)
                            ]))))),
            // bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildProperty1Default(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 15.h),
          child: Text("msg_enter_your_mobile".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 15.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 5.v),
      BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController,
            hintText: "lbl".tr,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  context.read<ForgetPasswordBloc>().add(
                      ChangePasswordVisibilityEvent(
                          value: !state.isShowPassword));
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                    child: CustomImageView(
                        imagePath: ImageConstant
                            .imgMaterialsymbolscreditcardoutlineGray600,
                        height: 22.adaptSize,
                        width: 22.adaptSize))),
            suffixConstraints: BoxConstraints(maxHeight: 64.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword);
      })
    ]);
  }

  /// Section Widget
  Widget _buildProperty1Variant2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Text("msg_enter_your_email".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 15.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 3.v),
      BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController1,
            hintText: "lbl".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  context.read<ForgetPasswordBloc>().add(
                      ChangePasswordVisibilityEvent1(
                          value: !state.isShowPassword1));
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                    child: CustomImageView(
                        imagePath: ImageConstant
                            .imgMaterialsymbolscreditcardoutlineGray600,
                        height: 22.adaptSize,
                        width: 22.adaptSize))),
            suffixConstraints: BoxConstraints(maxHeight: 64.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword1);
      })
    ]);
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30.h, right: 37.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(children: [
          _buildProperty1Default(context),
          SizedBox(height: 21.v),
          _buildProperty1Variant2(context)
        ]));
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 133.h, right: 133.h, bottom: 8.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Container(
            height: 5.v,
            width: 146.h,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1)))),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(color: appTheme.blueGray40001)))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
