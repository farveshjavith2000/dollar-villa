import 'bloc/no_internet_bloc.dart';
import 'models/no_internet_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<NoInternetBloc>(
      create: (context) => NoInternetBloc(NoInternetState(
        noInternetModelObj: NoInternetModel(),
      ))
        ..add(NoInternetInitialEvent()),
      child: NoInternetScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<NoInternetBloc, NoInternetState>(
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
                    flex: 29,
                  ),
                  _buildFrameColumn(context),
                  Spacer(
                    flex: 70,
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
  Widget _buildFrameColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 39.h,
        right: 27.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 88.h,
        vertical: 44.v,
      ),
      decoration: AppDecoration.outlineTealA100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder31,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLayerX00201GreenA200,
            height: 158.adaptSize,
            width: 158.adaptSize,
          ),
          SizedBox(height: 46.v),
          Text(
            "lbl_no_internet".tr,
            style: CustomTextStyles.titleMediumMontserratYellow90002,
          ),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }
}
