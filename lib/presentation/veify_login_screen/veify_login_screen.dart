import '../../core/utils/validation_functions.dart';
import 'bloc/veify_login_bloc.dart';
import 'models/veify_login_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VeifyLoginScreen extends StatelessWidget {
  VeifyLoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<VeifyLoginBloc>(
        create: (context) => VeifyLoginBloc(
            VeifyLoginState(veifyLoginModelObj: VeifyLoginModel()))
          ..add(VeifyLoginInitialEvent()),
        child: VeifyLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVector1x414,
                          height: 1.v,
                          width: 414.h),
                      SizedBox(height: 5.v),
                      //_buildCreatePinSection(context),
                      SizedBox(height: 60.v),
                      // CustomImageView(
                      //     imagePath: ImageConstant.imgLayerX00201,
                      //     height: 100.v,
                      //     width: 166.h,
                      //     alignment: Alignment.centerLeft,
                      //     margin: EdgeInsets.only(left: 117.h)),

                      SizedBox(
                          width: 203,
                          height: 131,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgLayerX00201,
                              height: 131.v,
                              width: 203.h)),

                      SizedBox(height: 18.v),
                      Text("msg_enter_pin".tr,
                          style: CustomTextStyles.titleSmallGray40002),
                      SizedBox(height: 58.v),
                      _buildVerifyEmailSection(context),
                      SizedBox(height: 5.v)
                    ]))),
           // bottomNavigationBar: _buildNavigationBarSection(context)
        )
    );
  }

  /// Section Widget
  Widget _buildCreatePinSection(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
        decoration: AppDecoration.fillDeepPurpleA,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // CustomImageView(
          //     imagePath: ImageConstant.imgArrowLeft,
          //     height: 17.v,
          //     width: 10.h,
          //     margin: EdgeInsets.only(bottom: 7.v),
          //     onTap: () {
          //       onTapImgArrowLeft(context);
          //     }),
          Padding(
              padding: EdgeInsets.only(left: 1.h, bottom: 5.v),
              child: Text("Verify Your Account".tr,
                  style: theme.textTheme.bodyMedium))
        ]));
  }

  /// Section Widget
  Widget _buildVerifyEmailSection(BuildContext context) {
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
                  // Text("lbl_verify_email".tr,
                  //     style: CustomTextStyles.titleMediumBlue600),
                  // SizedBox(height: 10.v),
                  SizedBox(
                      width: 190.h,
                      child: Text(
                          "msg_verification_code".tr + "\n" + Constants.mobile,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleSmallOpenSansBluegray400
                              .copyWith(height: 1.14))),
                  SizedBox(height: 27.v),
                  Text("msg_enter_5_digit_verification".tr,
                      style: theme.textTheme.labelMedium),
                  SizedBox(height: 12.v),
                  BlocSelector<VeifyLoginBloc, VeifyLoginState,
                          TextEditingController?>(
                      selector: (state) => state.editTextController,
                      builder: (context, editTextController) {
                        return CustomTextFormField(
                            validator: (value) {
                              if ((isNull(value, isRequired: true))) {
                                return "err_msg_please_enter_required".tr;
                              }
                              return null;
                            },
                            nooflength: 6,
                            controller: editTextController,
                            textInputAction: TextInputAction.done,
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            filled: true,
                            textInputType: TextInputType.number,
                            fillColor: appTheme.gray200);
                      }),
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
                                      verifyLoginApiCall(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 21.h),
                                        child: Text("lbl_confirm".tr,
                                            style: CustomTextStyles
                                                .titleSmallBlack900Medium)))
                              ]))),
                  SizedBox(height: 6.v)
                ])));
  }

  /// Section Widget
  Widget _buildNavigationBarSection(BuildContext context) {
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
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(color: appTheme.whiteA70001))),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(color: appTheme.blueGray40001)))
            ])));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://app.victoriaepay.com/VerifyLogin API and triggers a [CreateVerifyLoginEvent] event on the [VeifyLoginBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  verifyLoginApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<VeifyLoginBloc>().add(
            CreateVerifyLoginEvent(
              onCreateVerifyLoginEventSuccess: () {
                _onVerifyLoginPostEventSuccess(context);
              },
              onCreateVerifyLoginEventError: () {
                _onVerifyLoginPostEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dashBoardContainerScreen when the action is triggered.
  void _onVerifyLoginPostEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashBoardContainerScreen,
    );
  }

  /// Displays a snackBar message when the action is triggered.
  /// The data is retrieved from the `PostVerifyLoginPostResp` property of the
  /// `VeifyLoginBloc` using the `context.read` method.}
  void _onVerifyLoginPostEventError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context
                .read<VeifyLoginBloc>()
                .postVerifyLoginPostResp
                .message
                .toString() ??
            '')));
  }
}
