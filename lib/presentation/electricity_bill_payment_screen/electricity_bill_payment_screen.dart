import 'bloc/electricity_bill_payment_bloc.dart';
import 'models/electricity_bill_payment_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ElectricityBillPaymentScreen extends StatelessWidget {
  ElectricityBillPaymentScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ElectricityBillPaymentBloc>(
        create: (context) => ElectricityBillPaymentBloc(
            ElectricityBillPaymentState(
                electricityBillPaymentModelObj: ElectricityBillPaymentModel()))
          ..add(ElectricityBillPaymentInitialEvent()),
        child: ElectricityBillPaymentScreen());
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
                title:  Text( "msg_electricity_bill".tr,style: TextStyle(color: appTheme.white900),),
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
                              SizedBox(height: 21.v),
                              _buildFrameSixtyThree(context),
                              SizedBox(height: 21.v),
                              _buildFrameSixtySeven(context),
                              SizedBox(height: 31.v),
                              _buildFrameSixtySix(context),
                              SizedBox(height: 51.v),
                              CustomElevatedButton(
                                  text: "lbl_pay".tr,
                                  margin: EdgeInsets.only(left: 7.h),
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
        padding: EdgeInsets.only(left: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text("msg_enter_phone_number".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 3.v),
          BlocSelector<ElectricityBillPaymentBloc, ElectricityBillPaymentState,
                  TextEditingController?>(
              selector: (state) => state.phoneNumberController,
              builder: (context, phoneNumberController) {
                return CustomTextFormField(
                    controller: phoneNumberController,
                    hintText: "lbl_phone_number".tr,
                    textInputType: TextInputType.phone,
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 19.v, 16.h, 23.v),
                        child: CustomImageView(
                            imagePath: ImageConstant
                                .imgMaterialsymbolscreditcardoutline,
                            height: 22.adaptSize,
                            width: 22.adaptSize)),
                    suffixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (!isValidPhone(value)) {
                        return "err_msg_please_enter_valid_phone_number".tr;
                      }
                      return null;
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtyThree(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("msg_enter_consumer_number".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 3.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: BlocSelector<ElectricityBillPaymentBloc,
                      ElectricityBillPaymentState, TextEditingController?>(
                  selector: (state) => state.checkmarkController,
                  builder: (context, checkmarkController) {
                    return CustomTextFormField(
                        controller: checkmarkController,
                        hintText: "msg_enter_consumer_number".tr,
                        textInputType: TextInputType.number,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 26.v, 27.h, 26.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                                height: 12.v,
                                width: 15.h)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v),
                        validator: (value) {
                          if (!isNumeric(value)) {
                            return "err_msg_please_enter_valid_number".tr;
                          }
                          return null;
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySeven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("lbl_select_operator".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 1.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: BlocSelector<ElectricityBillPaymentBloc,
                      ElectricityBillPaymentState, TextEditingController?>(
                  selector: (state) => state.selectOperatorvalueController,
                  builder: (context, selectOperatorvalueController) {
                    return CustomTextFormField(
                        controller: selectOperatorvalueController,
                        hintText: "lbl_select_operator".tr,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 26.v, 27.h, 26.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                                height: 12.v,
                                width: 15.h)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v));
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h, right: 14.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text("lbl_enter_amount".tr,
                            style: TextStyle(
                                color: theme.colorScheme.errorContainer,
                                fontSize: 15.fSize,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500))),
                    Text("lbl_get_bill".tr,
                        style: TextStyle(
                            color: appTheme.green400,
                            fontSize: 15.fSize,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500))
                  ])),
          SizedBox(height: 4.v),
          BlocSelector<ElectricityBillPaymentBloc, ElectricityBillPaymentState,
                  TextEditingController?>(
              selector: (state) => state.amountController,
              builder: (context, amountController) {
                return CustomTextFormField(
                    controller: amountController,
                    hintText: "lbl_enter_amount2".tr,
                    textInputAction: TextInputAction.done,
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 21.v, 22.h, 21.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgCloseGreen400,
                            height: 22.adaptSize,
                            width: 22.adaptSize)),
                    suffixConstraints: BoxConstraints(maxHeight: 64.v));
              })
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
