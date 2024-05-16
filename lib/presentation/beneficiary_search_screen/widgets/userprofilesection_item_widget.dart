import '../models/userprofilesection_item_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilesectionItemWidget extends StatelessWidget {
  UserprofilesectionItemWidget(
    this.userprofilesectionItemModelObj, {
    Key? key,
    this.deleteBeneficiaryApiCall,
    this.navigateToFundTransfer,
  }) : super(
          key: key,
        );

  UserprofilesectionItemModel userprofilesectionItemModelObj;

  VoidCallback? deleteBeneficiaryApiCall;

  VoidCallback? navigateToFundTransfer;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Text(
                      userprofilesectionItemModelObj.aaditya!,
                      style: TextStyle(
                        color: appTheme.gray700,
                        fontSize: 15.916289329528809.fSize,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUp,
                    height: 17.v,
                    width: 15.h,
                    margin: EdgeInsets.only(top: 4.v),
                    onTap: () {
                      deleteBeneficiaryApiCall!.call();

                      PrefUtils().setBenIdForDelete(
                          userprofilesectionItemModelObj?.recipientId ?? '');
                      print(userprofilesectionItemModelObj?.recipientId);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 211.h,
                margin: EdgeInsets.only(left: 17.h),
                child: Text(
                  "ACC/NO:" +
                      userprofilesectionItemModelObj.udf1! +
                      "\n" +
                      userprofilesectionItemModelObj.bankName! +
                      "\n" +
                      userprofilesectionItemModelObj.udf2!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallErrorContainerMedium14,
                ),
              ),
            ),
            SizedBox(height: 41.v),
            CustomElevatedButton(
              text: "lbl_send".tr,
              margin: EdgeInsets.only(
                left: 17.h,
                right: 18.h,
              ),
              buttonStyle: CustomButtonStyles.none,
              decoration:
                  CustomButtonStyles.gradientIndigoAToPrimaryTL24Decoration,
              onPressed: () {
                navigateToFundTransfer!.call();
              },
            ),

          ],
        ),
      ),
    );
  }
}
