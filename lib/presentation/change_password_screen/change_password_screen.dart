import 'bloc/change_password_bloc.dart';
import 'models/change_password_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ChangePasswordBloc>(
        create: (context) => ChangePasswordBloc(
            ChangePasswordState(changePasswordModelObj: ChangePasswordModel()))
          ..add(ChangePasswordInitialEvent()),
        child: ChangePasswordScreen());
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
                title:  Text( "lbl_change_password".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: SizedBox(
                width:401.h,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgVector1,
                                  height: 1.v,
                                  width: 414.h),
                              SizedBox(height: 77.v),
                              Container(
                                  width: 347.h,
                                  margin:
                                      EdgeInsets.only(left: 29.h, right: 36.h),
                                  child: Text("msg_enter_your_new_password".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: appTheme.gray800,
                                          fontSize: 12.fSize,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500))),
                              SizedBox(height: 83.v),
                              _buildFrame(context),
                              SizedBox(height: 51.v),
                              CustomElevatedButton(
                                  text: "lbl_submit".tr,
                                  margin:
                                      EdgeInsets.only(left: 29.h, right: 35.h),
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientIndigoAToPrimaryDecoration),
                              SizedBox(height: 5.v)
                            ]))))),
          //  bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildProperty1Default(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Text("msg_enter_old_password".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 15.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 5.v),
      BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController,
            hintText: "lbl".tr,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  context.read<ChangePasswordBloc>().add(
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
          child: Text("msg_enter_new_password".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 15.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 5.v),
      BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController1,
            hintText: "lbl".tr,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  context.read<ChangePasswordBloc>().add(
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
  Widget _buildProperty1Variant3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Text("msg_re_enter_password".tr,
              style: TextStyle(
                  color: theme.colorScheme.errorContainer,
                  fontSize: 15.fSize,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 5.v),
      BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          builder: (context, state) {
        return CustomTextFormField(
            controller: state.passwordController2,
            hintText: "lbl".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
                onTap: () {
                  context.read<ChangePasswordBloc>().add(
                      ChangePasswordVisibilityEvent2(
                          value: !state.isShowPassword2));
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
            obscureText: state.isShowPassword2);
      })
    ]);
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 29.h, right: 36.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(children: [
          _buildProperty1Default(context),
          SizedBox(height: 19.v),
          _buildProperty1Variant2(context),
          SizedBox(height: 19.v),
          _buildProperty1Variant3(context)
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
