import '../../core/utils/validation_functions.dart';
import '../../routes/navigation_args.dart';
import 'bloc/veify_code_change_pin_bloc.dart';
import 'models/veify_code_change_pin_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VeifyCodeChangePinScreen extends StatelessWidget {
  VeifyCodeChangePinScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<VeifyCodeChangePinBloc>(
        create: (context) => VeifyCodeChangePinBloc(VeifyCodeChangePinState(
            veifyCodeChangePinModelObj: VeifyCodeChangePinModel(),
            session_otpid: arg[NavigationArgs.sessionOtpid],
            mobile: arg[NavigationArgs.mobile],
            tpin: arg[NavigationArgs.tpin]))
          ..add(VeifyCodeChangePinInitialEvent()),
        child: VeifyCodeChangePinScreen());
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
              title:  Text( "msg_create_pin_for_otp".tr,style: TextStyle(color: appTheme.white900),),
              actions: <Widget>[]
          ),            body: Form(
    key: _formKey,
    child:SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 38),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector4,
                          height: 1.v,
                          width: 414.h),
                      // CustomImageView(
                      //     imagePath: ImageConstant.imgLayerX00201,
                      //     height: 100.v,
                      //     width: 166.h,
                      //     margin: EdgeInsets.only(left: 117.h)),

                      SizedBox(
                          width: 203,
                          height: 131,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgLayerX00201,
                              height: 131.v,
                              width: 203.h)),


                      _buildFrame(context),
                      Spacer(flex: 61)
                    ]))),
            //bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildEnterDigitVerificationCode(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_enter_6_digit_verification".tr,
          style: theme.textTheme.labelMedium),
      SizedBox(height: 12.v),
      BlocSelector<VeifyCodeChangePinBloc, VeifyCodeChangePinState,
              TextEditingController?>(
          selector: (state) => state.editTextController,
          builder: (context, editTextController) {
            return CustomTextFormField(
              nooflength: 6,
                validator: (value) {
                  if ((isNull(value, isRequired: true))) {
                    return "err_msg_please_enter_required".tr;
                  }
                  return null;
                },
                controller: editTextController,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                borderDecoration: TextFormFieldStyleHelper.fillGray,
                obscureText: true,
                filled: true,
                fillColor: appTheme.gray200);
          })
    ]);
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: EdgeInsets.only(left: 26.h),
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 42.v),
            decoration: AppDecoration.fillWhiteA
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("lbl_verify_code".tr,
                      style: CustomTextStyles.titleMediumBlue600),
                  SizedBox(height: 10.v),
                  SizedBox(
                      width: 201.h,
                      child: Text("msg_verification_code2".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleSmallOpenSansBluegray400
                              .copyWith(height: 1.14))),
                  SizedBox(height: 27.v),
                  _buildEnterDigitVerificationCode(context),
                  SizedBox(height: 53.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 3.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("lbl_cancel".tr,
                                    style: CustomTextStyles.titleSmallBlue600),
                                GestureDetector(
                                    onTap: () {
                                      verifyCodeChangePinApiCall(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 21.h),
                                        child: Text("lbl_confirm".tr,
                                            style: CustomTextStyles
                                                .titleSmallBlack900_1)))
                              ]))),
                  SizedBox(height: 6.v)
                ])));
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 133.h, right: 133.h, bottom: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Container(
            height: 5.v,
            width: 146.h,
            decoration: AppDecoration.fillWhiteA,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(width: 146.h, child: Divider())),
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

  /// Calls the https://app.victoriaepay.com/VerifyTpinotp API and triggers a [CreateVerifyTpinotpEvent] event on the [VeifyCodeChangePinBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  verifyCodeChangePinApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<VeifyCodeChangePinBloc>().add(
        CreateVerifyTpinotpEvent(
          onCreateVerifyTpinotpEventSuccess: () {
            _onVerifyTpinOtpEventSuccess(context);
          },
          onCreateVerifyTpinotpEventError: () {
            _onVerifyTpinOtpEventError(context);
          },
        ),
      );
    }
  }

  /// Navigates to the createPinScreen when the action is triggered.
  void _onVerifyTpinOtpEventSuccess(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
            .read<VeifyCodeChangePinBloc>()
            .postVerifyTpinOtpResp
            .detail
            .toString() ??
            '');
    NavigatorService.pushNamed(
      AppRoutes.dashBoardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onVerifyTpinOtpEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<VeifyCodeChangePinBloc>()
                .postVerifyTpinOtpResp
                .detail
                .toString() ??
            '');
  }
}
