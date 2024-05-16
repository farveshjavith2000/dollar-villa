import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../fund_transfer_error_dialog/fund_transfer_error_dialog.dart';
import 'bloc/dmt_verify_bloc.dart';
import 'models/dmt_verify_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class DmtVerifyScreen extends StatelessWidget {
  DmtVerifyScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtVerifyBloc>(
        create: (context) =>
            DmtVerifyBloc(DmtVerifyState(dmtVerifyModelObj: DmtVerifyModel()))
              ..add(DmtVerifyInitialEvent()),
        child: DmtVerifyScreen());
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
              padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 47.v),
              child: Column(children: [
                SizedBox(
                    width: 203,
                    height: 131,
                    child: CustomImageView(
                        imagePath: ImageConstant.imgLayerX00201,
                        height: 131.v,
                        width: 203.h)),
                Spacer(flex: 10),
                _buildPhoneNumberColumn(context),
                SizedBox(height: 28.v),
                CustomElevatedButton(
                    text: "lbl_submit".tr,
                    margin: EdgeInsets.only(left: 9.h),
                    buttonStyle: CustomButtonStyles.none,
                    decoration:
                        CustomButtonStyles.gradientIndigoAToPrimaryDecoration,
                    onPressed: () {
                      dmtPhoneVerificationNewRegister(context);
                    }),
                Spacer(flex: 73)
              ]))),
      // bottomNavigationBar: _buildNavigationBar(context)
    ));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildPhoneNumberColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("msg_enter_phone_number".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 3.v),
          BlocSelector<DmtVerifyBloc, DmtVerifyState, TextEditingController?>(
              selector: (state) => state.phoneNumberController,
              builder: (context, phoneNumberController) {
                return CustomTextFormField(
                    controller: phoneNumberController,
                    hintText: "lbl_phone_number".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.phone,
                    nooflength: 10,
                    suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 19.v, 26.h, 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgMditick,
                            height: 25.adaptSize,
                            width: 25.adaptSize)),
                    suffixConstraints: BoxConstraints(maxHeight: 64.v),
                    validator: (value) {
                      if (!isValidPhone(value)) {
                        return "err_msg_please_enter_valid_phone_number".tr;
                      }
                      if ((isNull(value, isRequired: true))) {
                        return "err_msg_please_enter_required".tr;
                      }
                      return null;
                    });
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

  /// Calls the https://app.victoriaepay.com/Dmt4SenderVerification API and triggers a [CreateDmt4SenderVerificationEvent] event on the [DmtVerifyBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateDmt4SenderVerificationEvent] event on the [DmtVerifyBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  dmtPhoneVerificationNewRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<DmtVerifyBloc>().add(
            CreateDmt4SenderVerificationEvent(
              onCreateDmt4SenderVerificationEventSuccess: () {
                _onSendVerificationRequestEventSuccess(context);
              },
              onCreateDmt4SenderVerificationEventError: () {
                _onSendVerificationRequestEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dmtNewRegistratiobnScreen when the action is triggered.
  void _onSendVerificationRequestEventSuccess(BuildContext context) {
    print("Output" +
        context
            .read<DmtVerifyBloc>()
            .postSendVerificationRequestResp
            .errorMsg
            .toString());
    if (context
            .read<DmtVerifyBloc>()
            .postSendVerificationRequestResp
            .errorMsg
            .toString() ==
        'New Sender') {
      NavigatorService.pushNamed(
        AppRoutes.dmtNewRegistrationScreen,
      );
    } else {
      NavigatorService.pushNamed(
        AppRoutes.beneficiarySearchScreen,
      );
    }
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onSendVerificationRequestEventError(BuildContext context) {


    /*Fluttertoast.showToast(
        msg: context
                .read<DmtVerifyBloc>()
                .postSendVerificationRequestResp
                .errorMsg
                .toString() ??
            '');*/



    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title:  Text('Error',style: TextStyle(color: Colors.red),),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(context
                    .read<DmtVerifyBloc>()
                    .postSendVerificationRequestResp
                    .errorMsg
                    .toString() ??
                    '',style: TextStyle(color: Colors.red),),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
