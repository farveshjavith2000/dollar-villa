import 'bloc/dmt_failed_bloc.dart';
import 'models/dmt_failed_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class DmtFailedScreen extends StatelessWidget {
  const DmtFailedScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DmtFailedBloc>(
      create: (context) => DmtFailedBloc(DmtFailedState(
        dmtFailedModelObj: DmtFailedModel(),
      ))
        ..add(DmtFailedInitialEvent()),
      child: DmtFailedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<DmtFailedBloc, DmtFailedState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.gray60001,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                color: appTheme.gray60001,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgGroup47,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                width: 401.h,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.h,
                      vertical: 298.v,
                    ),
                    decoration: AppDecoration.fillBlack,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 46.v),
                        _buildProductDetails(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildProductDetails(BuildContext context) {
    return Container(
      width: 356.h,
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(vertical: 26.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 33.v),
          CustomImageView(
            imagePath: ImageConstant.imgBiExclamationTriangleFill,
            height: 29.adaptSize,
            width: 29.adaptSize,
            alignment: Alignment.center,
          ),
          SizedBox(height: 9.v),
          Container(
            width: 279.h,
            margin: EdgeInsets.only(
              left: 30.h,
              right: 45.h,
            ),
            child: Text(
              "msg_amount_should_be".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumMontserratErrorContainer,
            ),
          ),
          SizedBox(height: 46.v),
          Divider(
            color: appTheme.gray40001,
            endIndent: 10.h,
          ),
          SizedBox(height: 22.v),
          Padding(
            padding: EdgeInsets.only(left: 158.h),
            child: Text(
              "lbl_ok".tr,
              style: CustomTextStyles.titleLargeOrangeA200,
            ),
          ),
        ],
      ),
    );
  }
}
