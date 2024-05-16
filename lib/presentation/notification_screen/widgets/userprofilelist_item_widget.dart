import '../models/userprofilelist_item_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.fillGray30001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder26,
          ),
          child: Text(
            userprofilelistItemModelObj.userName!,
            style: CustomTextStyles.titleLargeWhiteA70001,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8.h,
            top: 7.v,
            bottom: 7.v,
          ),
          child: Column(
            children: [
              Text(
                userprofilelistItemModelObj.marketName!,
                style: CustomTextStyles.titleSmallInterGray800Bold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                    padding: EdgeInsets.all(3.h),
                    decoration: AppDecoration.outlineWhiteA70001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVectorWhiteA700017x5,
                      height: 7.v,
                      width: 5.h,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 2.v,
                    ),
                    child: Text(
                      userprofilelistItemModelObj.sentCount!,
                      style: CustomTextStyles.labelMediumInterGray50001,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: Column(
            children: [
              Text(
                userprofilelistItemModelObj.date!,
                style: CustomTextStyles.labelLargeInterGray800,
              ),
              SizedBox(height: 3.v),
              Text(
                userprofilelistItemModelObj.time!,
                style: CustomTextStyles.bodySmallInterGray50001,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
