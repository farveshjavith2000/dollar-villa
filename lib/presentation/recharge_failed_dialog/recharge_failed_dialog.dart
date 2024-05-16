import 'bloc/recharge_failed_bloc.dart';
import 'models/recharge_failed_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RechargeFailedDialog extends StatelessWidget {
  const RechargeFailedDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<RechargeFailedBloc>(
      create: (context) => RechargeFailedBloc(RechargeFailedState(
        rechargeFailedModelObj: RechargeFailedModel(),
      ))
        ..add(RechargeFailedInitialEvent()),
      child: RechargeFailedDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 346.h,
      padding: EdgeInsets.symmetric(vertical: 13.v),
      decoration: AppDecoration.fillErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.v),
          CustomImageView(
            imagePath: ImageConstant.imgBiExclamationCircleFill,
            height: 34.adaptSize,
            width: 34.adaptSize,
          ),
          SizedBox(height: 10.v),
          Text(
            "lbl_recharge_failed".tr,
            style: CustomTextStyles.bodyMediumMontserrat14,
          ),
          SizedBox(height: 3.v),
          Container(
            width: 275.h,
            margin: EdgeInsets.only(
              left: 34.h,
              right: 35.h,
            ),
            child: Text(
              "msg_mobile_number_operator".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumMontserrat,
            ),
          ),
          SizedBox(height: 13.v),
          Column(
            children: [
              Divider(
                color: appTheme.whiteA70001,
              ),
              SizedBox(height: 8.v),
              Text(
                "lbl_ok".tr,
                style: CustomTextStyles.titleLargeMontserratWhiteA70001,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
