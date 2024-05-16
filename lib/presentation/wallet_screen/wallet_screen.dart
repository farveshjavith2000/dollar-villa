import 'bloc/wallet_bloc.dart';
import 'models/wallet_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<WalletBloc>(
        create: (context) =>
            WalletBloc(WalletState(walletModelObj: WalletModel()))
              ..add(WalletInitialEvent()),
        child: WalletScreen());
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
                title:  Text( "lbl_add_money".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Container(
                width: 401.h,
                padding: EdgeInsets.only(left: 20.h, top: 86.v, right: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAmountSection(context),
                      SizedBox(height: 28.v),
                      CustomElevatedButton(
                          text: "msg_add_money_to_wallet".tr,
                          margin: EdgeInsets.only(right: 12.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          buttonTextStyle: CustomTextStyles
                              .titleSmallMontserratWhiteA70001Bold_1),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget



  /// Section Widget
  Widget _buildAmountSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 23.h),
              child: Text("lbl_enter_amount3".tr,
                  style:
                      CustomTextStyles.titleSmallMontserratErrorContainer_1)),
          SizedBox(height: 7.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child:
                  BlocSelector<WalletBloc, WalletState, TextEditingController?>(
                      selector: (state) => state.amountController,
                      builder: (context, amountController) {
                        return CustomTextFormField(
                            controller: amountController,
                            hintText: "lbl_enter_amount2".tr,
                            hintStyle: CustomTextStyles
                                .titleSmallMontserratGray70001_1,
                            textInputAction: TextInputAction.done,
                            prefix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(20.h, 21.v, 7.h, 21.v),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgTablercoinrupee,
                                    height: 22.adaptSize,
                                    width: 22.adaptSize)),
                            prefixConstraints: BoxConstraints(maxHeight: 64.v),
                            contentPadding: EdgeInsets.only(
                                top: 22.v, right: 30.h, bottom: 22.v));
                      }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
