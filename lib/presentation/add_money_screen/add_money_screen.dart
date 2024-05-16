import 'bloc/add_money_bloc.dart';
import 'models/add_money_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddMoneyBloc>(
        create: (context) =>
            AddMoneyBloc(AddMoneyState(addMoneyModelObj: AddMoneyModel()))
              ..add(AddMoneyInitialEvent()),
        child: AddMoneyScreen());
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
              title:  Text( "lbl_add_money".tr,style: TextStyle(color: appTheme.white900),),
              actions: <Widget>[]
            ),
            body: Container(
                width: 401.h,
                padding: EdgeInsets.only(left: 20.h, top: 86.v, right: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAddMoneySection(context),
                      SizedBox(height: 28.v),
                      CustomElevatedButton(
                          text: "msg_add_money_to_wallet".tr,
                          margin: EdgeInsets.only(right: 12.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            onTapAddMoneyToWallet(context);
                          }),
                      SizedBox(height: 5.v)
                    ])),
            // bottomNavigationBar: _buildNavigationBar(context)
        ));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildAddMoneySection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 23.h),
              child: Text("lbl_enter_amount".tr,
                  style: TextStyle(
                      color: theme.colorScheme.errorContainer,
                      fontSize: 15.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500))),
          SizedBox(height: 7.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<AddMoneyBloc, AddMoneyState,
                      TextEditingController?>(
                  selector: (state) => state.amountController,
                  builder: (context, amountController) {
                    return CustomTextFormField(
                        controller: amountController,
                        hintText: "lbl_enter_amount2".tr,
                        textInputAction: TextInputAction.done,
                        prefix: Container(
                            margin: EdgeInsets.fromLTRB(20.h, 21.v, 7.h, 21.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 22.adaptSize,
                                width: 22.adaptSize)),
                        prefixConstraints: BoxConstraints(maxHeight: 64.v),
                        contentPadding: EdgeInsets.only(
                            top: 22.v, right: 30.h, bottom: 22.v));
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 129.h, right: 129.h, bottom: 8.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Container(
            height: 5.v,
            width: 142.h,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 142.h,
                      child: Divider(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1)))),
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

  /// Navigates to the dashBoardContainer1Screen when the action is triggered.
  onTapAddMoneyToWallet(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.dashBoardContainer1Screen,
    // );
  }
}
