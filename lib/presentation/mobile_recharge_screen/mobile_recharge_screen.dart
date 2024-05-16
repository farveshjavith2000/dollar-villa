import 'bloc/mobile_recharge_bloc.dart';
import 'models/mobile_recharge_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MobileRechargeScreen extends StatelessWidget {
  MobileRechargeScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<MobileRechargeBloc>(
        create: (context) => MobileRechargeBloc(
            MobileRechargeState(mobileRechargeModelObj: MobileRechargeModel()))
          ..add(MobileRechargeInitialEvent()),
        child: MobileRechargeScreen());
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
                title:  Text( "lbl_mobile_recharge".tr,style: TextStyle(color: appTheme.white900),),
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
                              SizedBox(height: 25.v),
                              _buildFrameSixtySeven(context),
                              SizedBox(height: 27.v),
                              _buildFrameSixtySix(context),
                              SizedBox(height: 41.v),
                              CustomElevatedButton(
                                  text: "lbl_pay".tr,
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
              child: Text("msg_enter_phone_number".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<MobileRechargeBloc, MobileRechargeState,
                      TextEditingController?>(
                  selector: (state) => state.phoneNumberController,
                  builder: (context, phoneNumberController) {
                    return CustomTextFormField(
                        controller: phoneNumberController,
                        hintText: "lbl_phone_number".tr,
                        textInputType: TextInputType.phone,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
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
              child: Text("lbl_select_operator".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 2.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<MobileRechargeBloc, MobileRechargeState,
                      MobileRechargeModel?>(
                  selector: (state) => state.mobileRechargeModelObj,
                  builder: (context, mobileRechargeModelObj) {
                    return CustomDropDown(
                        hintText: "lbl_select_operator".tr,
                        items: mobileRechargeModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          context
                              .read<MobileRechargeBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("lbl_enter_amount".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<MobileRechargeBloc, MobileRechargeState,
                      TextEditingController?>(
                  selector: (state) => state.amountController,
                  builder: (context, amountController) {
                    return CustomTextFormField(
                        controller: amountController,
                        hintText: "lbl_enter_amount2".tr,
                        textInputAction: TextInputAction.done,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 21.v, 20.h, 21.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCloseGreen400,
                                height: 22.adaptSize,
                                width: 22.adaptSize)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v));
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
