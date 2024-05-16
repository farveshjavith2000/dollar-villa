import 'bloc/recharge_successfully_bloc.dart';
import 'models/recharge_successfully_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RechargeSuccessfullyDialog extends StatelessWidget {
  const RechargeSuccessfullyDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<RechargeSuccessfullyBloc>(
      create: (context) => RechargeSuccessfullyBloc(RechargeSuccessfullyState(
        rechargeSuccessfullyModelObj: RechargeSuccessfullyModel(),
      ))
        ..add(RechargeSuccessfullyInitialEvent()),
      child: RechargeSuccessfullyDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 333.h,
      padding: EdgeInsets.symmetric(
        horizontal: 71.h,
        vertical: 52.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder31,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVectorGreen40001,
            height: 57.adaptSize,
            width: 57.adaptSize,
          ),
          SizedBox(height: 47.v),
          Text(
            "msg_recharge_successfully".tr,
            style: CustomTextStyles.titleMediumMontserratGray900,
          ),
          SizedBox(height: 25.v),
      GestureDetector(
        onTap: () {
          onTapTxtOk(context);
        },
        child: Text(
            "lbl_ok".tr,
            style: CustomTextStyles.titleLargeMontserratGreen40001,
          )),
        ],
      ),
    );
  }
  /// Navigates to the dashBoardContainerScreen when the action is triggered.
  onTapTxtOk(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashBoardContainerScreen,
    );
  }

}
