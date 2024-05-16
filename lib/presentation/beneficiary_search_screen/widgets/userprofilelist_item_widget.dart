import '../models/userprofilelist_item_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
    this.deleteBeneficiaryFromList,
    this.sendFundTransferNav,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  VoidCallback? deleteBeneficiaryFromList;
  VoidCallback? sendFundTransferNav;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          userprofilelistItemModelObj.name!,
                          style: CustomTextStyles.titleSmallGray70001,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVectorDeepOrangeA100,
                        height: 18.v,
                        width: 15.h,
                        margin: EdgeInsets.only(
                          top: 12.v,
                          bottom: 52.v,
                        ),
                        onTap: () {
                          // Store id
                          print("Store Ben Id for Delete");
                          PrefUtils().setBenIdForDelete(
                              userprofilelistItemModelObj?.recipientId ?? '');
                          print(userprofilelistItemModelObj?.recipientId);
                          deleteBeneficiaryFromList!.call();
                          //deleteBeneficiaryFromList!();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 211.h,
                    child: Text(
                      "ACC/NO:" +
                          userprofilelistItemModelObj.udf1! +
                          "\n" +
                          userprofilelistItemModelObj.bankName! +
                          "\n" +
                          userprofilelistItemModelObj.udf2!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallErrorContainerMedium14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 41.v),
            CustomElevatedButton(
              height: 49.v,
              text: "lbl_send".tr,
              margin: EdgeInsets.only(
                left: 17.h,
                right: 18.h,
              ),
              buttonStyle: CustomButtonStyles.none,
              decoration:
                  CustomButtonStyles.gradientIndigoAToPrimaryTL24Decoration,
              buttonTextStyle: CustomTextStyles.titleSmallCabinWhiteA70001,
              onPressed: () {
                sendFundTransferNav!.call();
              },
            ),
            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
