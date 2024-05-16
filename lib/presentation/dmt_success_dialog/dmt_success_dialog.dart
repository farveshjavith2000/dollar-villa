import 'bloc/dmt_success_bloc.dart';
import 'models/dmt_success_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class DmtSuccessDialog extends StatelessWidget {
  const DmtSuccessDialog({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtSuccessBloc>(
        create: (context) => DmtSuccessBloc(
            DmtSuccessState(dmtSuccessModelObj: DmtSuccessModel()))
          ..add(DmtSuccessInitialEvent()),
        child: DmtSuccessDialog());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 346.h,
        padding: EdgeInsets.symmetric(horizontal: 56.h, vertical: 55.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder31),
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
                  style: CustomTextStyles.titleSmallMontserratGray900),
              SizedBox(height: 13.v),
              GestureDetector(
                  onTap: () {
                    onTapTxtOk(context);
                  },
                  child: Text("lbl_ok".tr,
                      style: CustomTextStyles.titleLargeMontserratGreen40001))
            ]));
  }

  /// Navigates to the dashBoardContainerScreen when the action is triggered.
  onTapTxtOk(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashBoardContainerScreen,
    );
  }
}
