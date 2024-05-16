import 'bloc/dth_recharge_bloc.dart';
import 'models/dth_recharge_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DthRechargeScreen extends StatelessWidget {
  DthRechargeScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<DthRechargeBloc>(
        create: (context) => DthRechargeBloc(
            DthRechargeState(dthRechargeModelObj: DthRechargeModel()))
          ..add(DthRechargeInitialEvent()),
        child: DthRechargeScreen());
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
                title:  Text( "lbl_dth_recharge2".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: SizedBox(
                width: 401.h,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(children: [
                              _buildArrowLeftFrame(context),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28.h, vertical: 41.v),
                                  child: Column(children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 104.h),
                                            child: Row(children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgClose,
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
                                                  child: Text(
                                                      PrefUtils().getWalletBalance(),
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.gray900,
                                                          fontSize: 12.fSize,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w700)))
                                            ]))),
                                    SizedBox(height: 27.v),
                                    _buildFrameNumber(context),
                                    SizedBox(height: 25.v),
                                    _buildFrameSelectOperator(context),
                                    SizedBox(height: 27.v),
                                    _buildFrameEnterAmount(context),
                                    SizedBox(height: 41.v),
                                    CustomElevatedButton(
                                        text: "lbl_pay".tr,
                                        margin: EdgeInsets.only(right: 9.h),
                                        buttonStyle: CustomButtonStyles.none,
                                        decoration: CustomButtonStyles
                                            .gradientIndigoAToPrimaryDecoration),
                                    SizedBox(height: 5.v)
                                  ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildArrowLeftFrame(BuildContext context) {
    return SizedBox(
        height: 50.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 126.h, top: 5.v),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 17.v,
                        width: 10.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                        onTap: () {
                          onTapImgArrowLeft(context);
                        }),
                    Padding(
                        padding: EdgeInsets.only(left: 19.h),
                        child: Text("lbl_dth_recharge".tr,
                            style: TextStyle(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(1),
                                fontSize: 15.fSize,
                                fontFamily: 'Inder',
                                fontWeight: FontWeight.w400)))
                  ]))),

        ]));
  }

  /// Section Widget
  Widget _buildFrameNumber(BuildContext context) {
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
              child: BlocSelector<DthRechargeBloc, DthRechargeState,
                      TextEditingController?>(
                  selector: (state) => state.numberController,
                  builder: (context, numberController) {
                    return CustomTextFormField(
                        controller: numberController,
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
                            left: 19.h, top: 22.v, bottom: 22.v));
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSelectOperator(BuildContext context) {
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
              child: BlocSelector<DthRechargeBloc, DthRechargeState,
                      DthRechargeModel?>(
                  selector: (state) => state.dthRechargeModelObj,
                  builder: (context, dthRechargeModelObj) {
                    return CustomDropDown(
                        hintText: "lbl_select_operator".tr,
                        items: dthRechargeModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          context
                              .read<DthRechargeBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFrameEnterAmount(BuildContext context) {
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
              child: BlocSelector<DthRechargeBloc, DthRechargeState,
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
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
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
