import 'bloc/gass_bill_payment_bloc.dart';
import 'models/gass_bill_payment_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class GassBillPaymentScreen extends StatelessWidget {
  GassBillPaymentScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<GassBillPaymentBloc>(
        create: (context) => GassBillPaymentBloc(GassBillPaymentState(
            gassBillPaymentModelObj: GassBillPaymentModel()))
          ..add(GassBillPaymentInitialEvent()),
        child: GassBillPaymentScreen());
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
                title:  Text( "lbl_gass_bill".tr,style: TextStyle(color: appTheme.white900),),
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
                              SizedBox(height: 39.v),
                              _buildGasProviderSection(context),
                              SizedBox(height: 26.v),
                              _buildCaNumberSection(context),
                              SizedBox(height: 63.v),
                              CustomElevatedButton(
                                  text: "lbl_proceed".tr,
                                  margin: EdgeInsets.only(right: 10.h),
                                  buttonStyle: CustomButtonStyles.none,
                                  decoration: CustomButtonStyles
                                      .gradientIndigoAToPrimaryDecoration),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildGasProviderSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text("lbl_gas_provider".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: BlocSelector<GassBillPaymentBloc, GassBillPaymentState,
                      GassBillPaymentModel?>(
                  selector: (state) => state.gassBillPaymentModelObj,
                  builder: (context, gassBillPaymentModelObj) {
                    return CustomDropDown(
                        hintText: "lbl_gas_provider".tr,
                        items: gassBillPaymentModelObj?.dropdownItemList ?? [],
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 17.h, vertical: 22.v),
                        onChanged: (value) {
                          context
                              .read<GassBillPaymentBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildCaNumberSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 19.h, right: 22.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("lbl_ca_number".tr,
                        style: TextStyle(
                            color: theme.colorScheme.errorContainer,
                            fontSize: 15.fSize,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500)),
                    Text("lbl_get_bill".tr,
                        style: TextStyle(
                            color: appTheme.green400,
                            fontSize: 15.fSize,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500))
                  ])),
          SizedBox(height: 5.v),
          BlocSelector<GassBillPaymentBloc, GassBillPaymentState,
                  TextEditingController?>(
              selector: (state) => state.cANumbervalueController,
              builder: (context, cANumbervalueController) {
                return CustomTextFormField(
                    controller: cANumbervalueController,
                    hintText: "lbl_ca_number".tr,
                    textInputAction: TextInputAction.done,
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
                    contentPadding:
                        EdgeInsets.only(left: 17.h, top: 22.v, bottom: 22.v));
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
