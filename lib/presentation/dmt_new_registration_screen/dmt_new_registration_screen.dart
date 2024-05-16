import 'bloc/dmt_new_registration_bloc.dart';
import 'models/dmt_new_registration_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class DmtNewRegistrationScreen extends StatelessWidget {
  DmtNewRegistrationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtNewRegistrationBloc>(
        create: (context) => DmtNewRegistrationBloc(DmtNewRegistrationState(
            dmtNewRegistrationModelObj: DmtNewRegistrationModel()))
          ..add(DmtNewRegistrationInitialEvent()),
        child: DmtNewRegistrationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(

            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_money_transfer".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: 401.h,
                    padding:
                        EdgeInsets.only(left: 22.h, top: 65.v, right: 22.h),
                    child: Column(children: [
                      _buildFrame(context),
                      SizedBox(height: 24.v),
                      _buildFrameSixtySeven(context),
                      SizedBox(height: 26.v),
                      _buildFrameSixtySix(context),
                      SizedBox(height: 42.v),
                      CustomElevatedButton(
                          text: "lbl_register".tr,
                          margin: EdgeInsets.only(left: 8.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            dmtNewRegistrationApiCall(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))),
           // bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 15.h),
              child:
                  Text("lbl_first_name".tr, style: TextStyle(color: Colors.black)),),
          SizedBox(height: 5.v),
          BlocSelector<DmtNewRegistrationBloc, DmtNewRegistrationState,
                  TextEditingController?>(
              selector: (state) => state.nameController,
              builder: (context, nameController) {
                return CustomTextFormField(
                    controller: nameController,
                    hintText: "lbl_first_name".tr,
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgMditick,
                            height: 22.adaptSize,
                            width: 22.adaptSize)),
                    suffixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if ((isNull(value, isRequired: true))) {
                        return "err_msg_please_enter_required".tr;
                      }
                      if (!isText(value)) {
                        return "err_msg_please_enter_valid_text".tr;
                      }
                      return null;

                    },

                    );
              })
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySeven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 15.h),
              child:
                  Text("lbl_last_name".tr, style: TextStyle(color: Colors.black)),),
          SizedBox(height: 3.v),
          BlocSelector<DmtNewRegistrationBloc, DmtNewRegistrationState,
                  TextEditingController?>(
              selector: (state) => state.nameController1,
              builder: (context, nameController1) {
                return CustomTextFormField(
                    controller: nameController1,
                    hintText: "lbl_last_name".tr,
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 26.v, 22.h, 26.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgVectorGray700,
                            height: 12.v,
                            width: 15.h)),
                    suffixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (!isText(value)) {
                        return "err_msg_please_enter_valid_text".tr;
                      }
                      if ((isNull(value, isRequired: true))) {
                        return "err_msg_please_enter_required".tr;
                      }
                      return null;
                    }
                    );
              })
        ]));
  }

  /// Section Widget
  Widget _buildFrameSixtySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 15.h),
              child:
                  Text("lbl_enter_otp".tr, style: TextStyle(color: Colors.black)),),
          SizedBox(height: 5.v),
          BlocSelector<DmtNewRegistrationBloc, DmtNewRegistrationState,
                  TextEditingController?>(
              selector: (state) => state.otpController,
              builder: (context, otpController) {
                return CustomTextFormField(
                    controller: otpController,
                    hintText: "lbl_otp".tr,
                    hintStyle: CustomTextStyles.titleSmallGray700,
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.all(22.h),
                    validator: (value) {
                  if (!isNumeric(value)) {
                    return "err_msg_please_enter_valid_text".tr;
                  }
                  if ((isNull(value, isRequired: true))) {
                    return "err_msg_please_enter_required".tr;
                  }
                  return null;
                }
                );
              })
        ]));
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 129.h, right: 129.h, bottom: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Container(
            height: 5.v,
            width: 142.h,
            decoration: AppDecoration.fillWhiteA,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(width: 142.h, child: Divider())),
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

  /// Calls the https://app.victoriaepay.com/Dmt4SenderRegistration API and triggers a [CreateDmt4SenderRegistrationEvent] event on the [DmtNewRegistrationBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateDmt4SenderRegistrationEvent] event on the [DmtNewRegistrationBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  dmtNewRegistrationApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<DmtNewRegistrationBloc>().add(
            CreateDmt4SenderRegistrationEvent(
              onCreateDmt4SenderRegistrationEventSuccess: () {
                _onRegisterDmt4SenderEventSuccess(context);
              },
              onCreateDmt4SenderRegistrationEventError: () {
                _onRegisterDmt4SenderEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dmtVerifyScreen when the action is triggered.
  void _onRegisterDmt4SenderEventSuccess(BuildContext context) {

    Fluttertoast.showToast(
        msg: context
            .read<DmtNewRegistrationBloc>()
            .postRegisterDmt4SenderResp
            .message
            .toString() ??
            '');
    NavigatorService.pushNamed(
      AppRoutes.dmtVerifyScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onRegisterDmt4SenderEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<DmtNewRegistrationBloc>()
                .postRegisterDmt4SenderResp
                .message
                .toString() ??
            '');
  }
}
