
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/presentation/reports_screen/models/paymentdetails_item_model.dart';
import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class ReportdetailsItemWidget extends StatelessWidget {
  ReportdetailsItemWidget(
    this.reporttdetailsItemModelObj, {
    Key? key,
    this.onTapViewDetails,
  }) : super(
          key: key,
        );

  ReportdetailsItemModel reporttdetailsItemModelObj;

  VoidCallback? onTapViewDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder23,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹" + reporttdetailsItemModelObj.amount!,
                        style: CustomTextStyles.titleSmallGray80001,
                      ),
                      SizedBox(height: 2.v),

                    ],
                  ),
                ),
              ),
              (reporttdetailsItemModelObj.sucess!='')?Container(
                width: 80.h,
                margin: EdgeInsets.only(
                  left: 2.h,
                  bottom: 40.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reporttdetailsItemModelObj.sucess!,
                      style: (reporttdetailsItemModelObj.sucess == 'SUCCESS')
                          ? CustomTextStyles.labelLargePoppinsGreen500
                          : CustomTextStyles.labelLargePoppinsRed500,
                    ),
                    CustomImageView(
                      imagePath:
                          (reporttdetailsItemModelObj.sucess == 'SUCCESS')
                              ? ImageConstant.imgVectorGreen50013x13
                              : ImageConstant.imgVectorRed600,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(
                        left: 4.h,
                        top: 3.v,
                        bottom: 3.v,
                      ),
                    ),
                  ],
                ),
              ):SizedBox(),
            ],
          ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(
                reporttdetailsItemModelObj.date!,
                style: theme.textTheme.bodySmall,
              )),
              Text(
                reporttdetailsItemModelObj.date1!,
                style: CustomTextStyles.titleSmallGray80001,
              ),
              // Text(
              //   reporttdetailsItemModelObj.time!,
              //   style: theme.textTheme.bodySmall,
              // ),
            ],
          ),
          SizedBox(height: 5.v),
          (reporttdetailsItemModelObj.paymentMode1!='')?Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    reporttdetailsItemModelObj.paymentMode!,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  reporttdetailsItemModelObj.paymentMode1!,
                  style: CustomTextStyles.titleSmallGray80001,
                ),
              ],
            ),
          ):SizedBox(),
          (reporttdetailsItemModelObj.ClientRefId!='' && Constants.reportFilterType!='rechargerpt')?Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text("lbl_client_refid".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  reporttdetailsItemModelObj.ClientRefId!,
                  style: CustomTextStyles.titleSmallGray80001,
                ),
              ],
            ),
          ):SizedBox(),
          SizedBox(height: 5.v),
          (reporttdetailsItemModelObj.requestid!='')?Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Text(
                    reporttdetailsItemModelObj.refNumber!,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  reporttdetailsItemModelObj.requestid!,
                  style: CustomTextStyles.titleSmallGray80001,
                ),
              ],
            ),
          ):SizedBox(),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
            text: "lbl_view_details".tr,
            onPressed: () {

              PrefUtils()
                  .setViewDetailPrice(reporttdetailsItemModelObj.amount!);
              PrefUtils()
                  .setViewDetailStatus(reporttdetailsItemModelObj.sucess!);
              PrefUtils()
                  .setViewDetailMode(reporttdetailsItemModelObj.paymentMode1!);
              PrefUtils()
                  .setViewDetailRefNo(reporttdetailsItemModelObj.refNumber1!);
              PrefUtils()
                  .setViewDetailDate(reporttdetailsItemModelObj.date1!);
              PrefUtils()
                  .setViewDetailTime(reporttdetailsItemModelObj.time!);
              onTapViewDetails!.call();
            },
          ),
        ],
      ),
    );
  }
}
