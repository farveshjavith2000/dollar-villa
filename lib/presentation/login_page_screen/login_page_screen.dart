import 'bloc/login_page_bloc.dart';
import 'models/login_page_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginPageBloc>(
        create: (context) =>
            LoginPageBloc(LoginPageState(loginPageModelObj: LoginPageModel()))
              ..add(LoginPageInitialEvent()),
        child: LoginPageScreen());
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
                          imagePath: ImageConstant.imgVector3,
                          height: 1.v,
                          width: 414.h),
                      SizedBox(height: 10.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 100.h),
                              child: SizedBox(
                                  height: 33.v,
                                  child: VerticalDivider(
                                      width: 1.h,
                                      thickness: 1.v,
                                      color: appTheme.whiteA70001)))),
                      SizedBox(height: 63.v),
                    SizedBox(width:203,height:131,child:CustomImageView(
                          imagePath: ImageConstant.imgLayerX00201,
                          height: 131.v,
                          width: 203.h)),
                      SizedBox(height: 40.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 55.h),
                              child: Text("lbl_login".tr,
                                  style: CustomTextStyles
                                      .titleSmallBlack900Medium_1))),
                      SizedBox(height: 11.v),
                      Padding(
                          padding: EdgeInsets.only(left: 35.h, right: 32.h),
                          child: BlocSelector<LoginPageBloc, LoginPageState,
                                  TextEditingController?>(
                              selector: (state) => state.phoneNumberController,
                              builder: (context, phoneNumberController) {
                                return CustomTextFormField(
                                  nooflength: 10,
                                    controller: phoneNumberController,
                                    hintText: "msg_your_phone_number".tr,
                                    textInputType: TextInputType.phone,
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 19.v, 25.h, 20.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgMditickBlack900,
                                            height: 25.adaptSize,
                                            width: 25.adaptSize)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 64.v),
                                    validator: (value) {

                                      if (
                                          (isNull(value,
                                              isRequired: true))) {
                                        return "err_msg_please_enter_required"
                                            .tr;
                                      }

                                      if (!isValidPhone(value)) {
                                        return "err_msg_please_enter_valid_phone_number"
                                            .tr;
                                      }
                                      return null;
                                    });
                              })),
                      SizedBox(height: 28.v),
                      Padding(
                          padding: EdgeInsets.only(left: 35.h, right: 32.h),
                          child: BlocBuilder<LoginPageBloc, LoginPageState>(
                              builder: (context, state) {
                            return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "lbl2".tr,
                                hintStyle: CustomTextStyles
                                    .titleMediumMontserratGray700Medium,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      context.read<LoginPageBloc>().add(
                                          ChangePasswordVisibilityEvent(
                                              value: !state.isShowPassword));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 18.v, 25.h, 21.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgMdieyeoutline,
                                            height: 25.adaptSize,
                                            width: 25.adaptSize))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 64.v),
                                validator: (value) {
                                  if (
                                  (isNull(value,
                                      isRequired: true))) {
                                    return "err_msg_please_enter_required"
                                        .tr;
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword);
                          })),
                      SizedBox(height: 12.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 40.h),
                              child: Text("lbl_forgot".tr,
                                  style: CustomTextStyles.titleSmallGray700))),
                      SizedBox(height: 27.v),
                      CustomOutlinedButton(
                          height: 60.v,
                          text: "lbl_login".tr,
                          margin: EdgeInsets.only(left: 35.h, right: 32.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryTL30Decoration,
                          buttonTextStyle: theme.textTheme.titleSmall!,
                          onPressed: () {
                            loginApiCall(context);
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Calls the https://app.victoriaepay.com/mLogin API and triggers a [CreateMLoginEvent] event on the [LoginPageBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateMLoginEvent] event on the [LoginPageBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  loginApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginPageBloc>().add(
            CreateMLoginEvent(
              onCreateMLoginEventSuccess: () {
                _onMLoginPostFunctionEventSuccess(context);
              },
              onCreateMLoginEventError: () {
                _onMLoginPostFunctionEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the veifyLoginScreen when the action is triggered.
  void _onMLoginPostFunctionEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.veifyLoginScreen,
    );
  }

  /// Displays a snackBar message when the action is triggered.
  /// The data is retrieved from the `PostMLoginPostFunctionResp` property of the
  /// `LoginPageBloc` using the `context.read` method.}
  void _onMLoginPostFunctionEventError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context
                .read<LoginPageBloc>()
                .postMLoginPostFunctionResp
                .message
                .toString() ??
            '')));
  }
}
