import '../fund_transfer_error_dialog/fund_transfer_error_dialog.dart';
import '../fund_transfer_success_dialog/fund_transfer_success_dialog.dart';
import 'bloc/dmt_pin_bloc.dart';
import 'models/dmt_pin_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class DmtPinScreen extends StatelessWidget {
  DmtPinScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtPinBloc>(
        create: (context) =>
            DmtPinBloc(DmtPinState(dmtPinModelObj: DmtPinModel()))
              ..add(DmtPinInitialEvent()),
        child: DmtPinScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
          appBar:  AppBar(
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
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 47.v),
                    child: Column(children: [
                      SizedBox(width:203,height:131,child:CustomImageView(
                          imagePath: ImageConstant.imgLayerX00201,
                          height: 131.v,
                          width: 203.h)),
                      SizedBox(height: 16.v),
                      Text("lbl_transaction_pin".tr,
                          style: CustomTextStyles.titleSmallPrimaryContainer),
                      SizedBox(height: 74.v),
                      _buildPasswordColumn(context),
                      SizedBox(height: 28.v),
                      CustomElevatedButton(
                          text: "lbl_submit".tr,
                          margin: EdgeInsets.only(left: 9.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              checkTpinForTransaction(context);
                            }
                          }),
                      SizedBox(height: 5.v)
                    ]))),
            //bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildPasswordColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text("msg_enter_the_transaction".tr,
                  style: CustomTextStyles.titleSmall14)),
          SizedBox(height: 5.v),
          BlocBuilder<DmtPinBloc, DmtPinState>(builder: (context, state) {
            return CustomTextFormField(
                controller: state.passwordController,
                hintText: "lbl".tr,
                nooflength: 4,
                hintStyle: CustomTextStyles.titleMediumMontserratGray700,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                suffix: InkWell(
                    onTap: () {
                      context.read<DmtPinBloc>().add(
                          ChangePasswordVisibilityEvent(
                              value: !state.isShowPassword));
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.h, vertical: 24.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 13.v,
                            width: 20.h))),
                suffixConstraints: BoxConstraints(maxHeight: 64.v),
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

  /// Calls the https://app.victoriaepay.com/Checking_Tpin API and triggers a [CreateCheckingTpinEvent] event on the [DmtPinBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateCheckingTpinEvent] event on the [DmtPinBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  checkTpinForTransaction(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<DmtPinBloc>().add(
            CreateCheckingTpinEvent(
              onCreateCheckingTpinEventSuccess: () {
                _onCheckingTpinPostEventSuccess(context);
              },
              onCreateCheckingTpinEventError: () {
                _onCheckingTpinPostEventError(context);
              },
            ),
          );
    }
  }

  /// Calls the https://app.victoriaepay.com/Dmt4FundTransfer API and triggers a [CreateDmt4FundTransferEvent] event on the [DmtPinBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  void _onCheckingTpinPostEventSuccess(BuildContext context) {
    context.read<DmtPinBloc>().add(
          CreateDmt4FundTransferEvent(),
        );

   /* showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: FundTransferSuccessDialog.builder(context),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
        ));*/
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCheckingTpinPostEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<DmtPinBloc>()
                .postCheckingTpinPostResp
                .detail
                .toString() ??
            '');
    /*PrefUtils().setTransactionMessage(context
        .read<DmtPinBloc>()
        .postCheckingTpinPostResp
        .detail
        .toString() ??
        '');
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: FundTransferErrorDialog.builder(context),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 0),
        ));*/

  }
}
