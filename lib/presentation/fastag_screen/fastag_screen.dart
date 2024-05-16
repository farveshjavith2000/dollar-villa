import 'bloc/fastag_bloc.dart';
import 'models/fastag_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FastagScreen extends StatelessWidget {
  FastagScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FastagBloc>(
        create: (context) =>
            FastagBloc(FastagState(fastagModelObj: FastagModel()))
              ..add(FastagInitialEvent()),
        child: FastagScreen());
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
                title:  Text( "lbl_fastag".tr,style: TextStyle(color: appTheme.white900),),
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
                                horizontal: 27.h, vertical: 41.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 105.h),
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
                                      ])),
                                  SizedBox(height: 40.v),
                                  _buildFastagIssuingBank(context),
                                  SizedBox(height: 26.v),
                                  _buildVehicleNumber(context),
                                  SizedBox(height: 63.v),
                                  CustomElevatedButton(
                                      text: "lbl_proceed".tr,
                                      margin: EdgeInsets.only(right: 12.h),
                                      buttonStyle: CustomButtonStyles.none,
                                      decoration: CustomButtonStyles
                                          .gradientIndigoAToPrimaryDecoration),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildFastagIssuingBank(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text("msg_fastag_issuing_bank".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 2.v),
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: BlocSelector<FastagBloc, FastagState, FastagModel?>(
                  selector: (state) => state.fastagModelObj,
                  builder: (context, fastagModelObj) {
                    return CustomDropDown(
                        hintText: "msg_fastag_issuing_bank".tr,
                        items: fastagModelObj?.dropdownItemList ?? [],
                        onChanged: (value) {
                          context
                              .read<FastagBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildVehicleNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text("lbl_vehicle_number".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child:
                  BlocSelector<FastagBloc, FastagState, TextEditingController?>(
                      selector: (state) => state.vehicleNumbervalueController,
                      builder: (context, vehicleNumbervalueController) {
                        return CustomTextFormField(
                            controller: vehicleNumbervalueController,
                            hintText: "lbl_vehicle_number".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number,
                            suffix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
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
                            });
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
