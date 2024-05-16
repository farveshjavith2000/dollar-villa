import 'bloc/dmt_success_bloc.dart';
import 'models/dmt_success_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class DmtSuccessScreen extends StatelessWidget {
  const DmtSuccessScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtSuccessBloc>(
        create: (context) => DmtSuccessBloc(
            DmtSuccessState(dmtSuccessModelObj: DmtSuccessModel()))
          ..add(DmtSuccessInitialEvent()),
        child: DmtSuccessScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<DmtSuccessBloc, DmtSuccessState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: Container(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height,
                  decoration: BoxDecoration(
                      color: appTheme.whiteA70001,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGroup47),
                          fit: BoxFit.cover)),
                  child: SizedBox(
                      width: 401.h,
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 23.h, vertical: 296.v),
                              decoration: AppDecoration.fillBlack,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 29.v),
                                    _buildPaymentConfirmation(context)
                                  ])))))));
    });
  }

  /// Section Widget
  Widget _buildPaymentConfirmation(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 56.h, vertical: 55.v),
        decoration: AppDecoration.outlineTealA100
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 26.v),
              CustomImageView(
                  imagePath: ImageConstant.imgVectorSecondarycontainer,
                  height: 57.adaptSize,
                  width: 57.adaptSize),
              SizedBox(height: 23.v),
              Text("msg_payment_has_been".tr,
                  style: CustomTextStyles.titleSmallGray900),
              SizedBox(height: 13.v),
              GestureDetector(
                  onTap: () {
                    onTapTxtOk(context);
                  },
                  child: Text("lbl_ok".tr, style: theme.textTheme.titleLarge))
            ]));
  }

  /// Navigates to the dashBoardContainerScreen when the action is triggered.
  onTapTxtOk(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashBoardContainerScreen,
    );
  }
}
