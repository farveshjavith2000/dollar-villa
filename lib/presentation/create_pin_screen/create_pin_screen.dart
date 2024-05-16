import '../../routes/navigation_args.dart';
import 'bloc/create_pin_bloc.dart';
import 'models/create_pin_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class CreatePinScreen extends StatelessWidget {
  CreatePinScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<CreatePinBloc>(
        create: (context) => CreatePinBloc(CreatePinState(
            createPinModelObj: CreatePinModel(),
            mem_id: arg[NavigationArgs.memId]))
          ..add(CreatePinInitialEvent()),
        child: CreatePinScreen());
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
                title:  Text( "lbl_create_pin".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      Spacer(flex: 33),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector1,
                          height: 1.v,
                          width: 414.h),
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
                      Text("msg_enter_new_transaction".tr,
                          style: CustomTextStyles.titleSmallGray40001),
                      SizedBox(height: 49.v),
                      _buildCreatePinFrameVariantTwo(context),
                      SizedBox(height: 19.v),
                      _buildCreatePinFrameVariantThree(context),
                      SizedBox(height: 53.v),
                      CustomElevatedButton(
                          text: "lbl_submit".tr,
                          margin: EdgeInsets.symmetric(horizontal: 33.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            createPinApiCall(context);
                          }),
                      Spacer(flex: 66)
                    ]))),
            //bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildCreatePinFrameVariantTwo(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text("msg_enter_new_password".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 5.v),
          BlocBuilder<CreatePinBloc, CreatePinState>(builder: (context, state) {
            return CustomTextFormField(
                controller: state.passwordController,
                hintText: "lbl".tr,
                nooflength: 4,
                hintStyle: CustomTextStyles.titleMediumMontserratGray700,
                textInputType: TextInputType.number,
                suffix: InkWell(
                    onTap: () {
                      context.read<CreatePinBloc>().add(
                          ChangePasswordVisibilityEvent(
                              value: !state.isShowPassword));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                        child: CustomImageView(
                            imagePath: ImageConstant
                                .imgMaterialsymbolscreditcardoutline,
                            height: 22.adaptSize,
                            width: 22.adaptSize))),
                suffixConstraints: BoxConstraints(maxHeight: 64.v),
                validator: (value) {
                  if ((isNull(value, isRequired: true))) {
                    return "err_msg_please_enter_required".tr;
                  }
                  return null;
                },
                obscureText: state.isShowPassword);
          })
        ]));
  }

  /// Section Widget
  Widget _buildCreatePinFrameVariantThree(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text("msg_re_enter_password".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 5.v),
          BlocBuilder<CreatePinBloc, CreatePinState>(builder: (context, state) {
            return CustomTextFormField(
                controller: state.passwordController1,
                hintText: "lbl".tr,
                hintStyle: CustomTextStyles.titleMediumMontserratGray700,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                nooflength: 4,
                suffix: InkWell(
                    onTap: () {
                      context.read<CreatePinBloc>().add(
                          ChangePasswordVisibilityEvent1(
                              value: !state.isShowPassword1));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                        child: CustomImageView(
                            imagePath: ImageConstant
                                .imgMaterialsymbolscreditcardoutline,
                            height: 22.adaptSize,
                            width: 22.adaptSize))),
                suffixConstraints: BoxConstraints(maxHeight: 64.v),
                validator: (value) {
                  /*if (value == null ||
                      (!isValidPassword(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_password".tr;
                  }*/
                  if (value == null) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                obscureText: state.isShowPassword1);
          })
        ]));
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

  /// Calls the https://app.victoriaepay.com/Create_Tpin API and triggers a [CreateCreateTpinEvent] event on the [CreatePinBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateCreateTpinEvent] event on the [CreatePinBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  createPinApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CreatePinBloc>().add(
            CreateCreateTpinEvent(
              onCreateCreateTpinEventSuccess: () {
                _onCreateTpinEventSuccess(context);
              },
              onCreateCreateTpinEventError: () {
                _onCreateTpinEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the veifyCodeChangePinScreen when the action is triggered.
  void _onCreateTpinEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.veifyCodeChangePinScreen, arguments: {
      NavigationArgs.sessionOtpid:
          context.read<CreatePinBloc>().postCreateTpinResp.sessionOtpid,
      NavigationArgs.mobile: Constants.mobile,
      NavigationArgs.tpin: context.read<CreatePinBloc>().postCreateTpinResp.tpin
    });
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTpinEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<CreatePinBloc>()
                .postCreateTpinResp
                .message
                .toString() ??
            '');
  }
}
