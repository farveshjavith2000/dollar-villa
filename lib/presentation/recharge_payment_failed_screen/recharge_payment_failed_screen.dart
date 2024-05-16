import 'bloc/recharge_payment_failed_bloc.dart';
import 'models/recharge_payment_failed_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class RechargePaymentFailedScreen extends StatelessWidget {
  const RechargePaymentFailedScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<RechargePaymentFailedBloc>(
      create: (context) => RechargePaymentFailedBloc(RechargePaymentFailedState(
        rechargePaymentFailedModelObj: RechargePaymentFailedModel(),
      ))
        ..add(RechargePaymentFailedInitialEvent()),
      child: RechargePaymentFailedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<RechargePaymentFailedBloc, RechargePaymentFailedState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 6.h),
              child: Column(
                children: [
                  _buildVectorRow(context),
                  Spacer(
                    flex: 41,
                  ),
                  _buildFrameFortySix(context),
                  Spacer(
                    flex: 58,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildVectorRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVectorWhiteA7000110x18,
            height: 10.v,
            width: 18.h,
            margin: EdgeInsets.only(
              top: 5.v,
              bottom: 17.v,
            ),
          ),
          Spacer(),
          SizedBox(
            height: 33.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: appTheme.whiteA70001,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVectorWhiteA7000127x26,
            height: 27.v,
            width: 26.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 3.v,
              bottom: 3.v,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPhBell,
            height: 27.adaptSize,
            width: 27.adaptSize,
            margin: EdgeInsets.only(
              left: 27.h,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameFortySix(BuildContext context) {
    return Container(
      width: 346.h,
      margin: EdgeInsets.symmetric(horizontal: 27.h),
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 13.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.v),
          CustomImageView(
            imagePath: ImageConstant.imgBiExclamationCircleFillRed900,
            height: 34.adaptSize,
            width: 34.adaptSize,
          ),
          SizedBox(height: 13.v),
          Text(
            "lbl_payment_failed".tr,
            style: CustomTextStyles.titleMediumMontserratRed900,
          ),
          SizedBox(height: 2.v),
          Container(
            width: 275.h,
            margin: EdgeInsets.only(
              left: 16.h,
              right: 17.h,
            ),
            child: Text(
              "msg_mobile_number_operator".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumMontserratRed900,
            ),
          ),
          SizedBox(height: 7.v),
          Divider(
            color: appTheme.gray40002,
            endIndent: 9.h,
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_ok".tr,
            style: CustomTextStyles.titleLargeMontserratRed900,
          ),
        ],
      ),
    );
  }
}
