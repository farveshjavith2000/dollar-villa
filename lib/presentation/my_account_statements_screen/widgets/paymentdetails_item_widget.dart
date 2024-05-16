import '../models/paymentdetails_item_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentdetailsItemWidget extends StatelessWidget {
  PaymentdetailsItemWidget(
    this.paymentdetailsItemModelObj, {
    Key? key,
    this.onTapViewDetails,
  }) : super(
          key: key,
        );

  PaymentdetailsItemModel paymentdetailsItemModelObj;

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
        mainAxisAlignment: MainAxisAlignment.start,
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
                        "₹" + paymentdetailsItemModelObj.amount!,
                        style: CustomTextStyles.titleSmallGray80001,
                      ),
                      SizedBox(height: 2.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            paymentdetailsItemModelObj.date!,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            paymentdetailsItemModelObj.date1!,
                            style: CustomTextStyles.titleSmallGray80001,
                          ),
                          // Text(
                          //   paymentdetailsItemModelObj.time!,
                          //   style: theme.textTheme.bodySmall,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    paymentdetailsItemModelObj.paymentMode!,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  paymentdetailsItemModelObj.paymentMode1!,
                  style: CustomTextStyles.titleSmallGray80001,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
            text: "lbl_view_details".tr,
            onPressed: () {
              PrefUtils()
                  .setViewClientRefId("");
              PrefUtils().setViewServiceCharge("");
              PrefUtils().setViewBenificiarhyId("");
              PrefUtils().setViewCustomerRefId("");
              PrefUtils().setViewBankRefId("");
              PrefUtils().setViewClientRefId("");

              PrefUtils().setViewProduct(
                  paymentdetailsItemModelObj.product!);

              PrefUtils().setViewOpeningBalance(
                  paymentdetailsItemModelObj.openingbalance!);

              PrefUtils().setViewClosingBalance(
                  paymentdetailsItemModelObj.closingbalance!);


              PrefUtils().setViewDetailDescription(
                  paymentdetailsItemModelObj.description!);
              PrefUtils()
                  .setViewDetailPrice(paymentdetailsItemModelObj.amount!);
              PrefUtils().setViewDetailStatus("");
              PrefUtils()
                  .setViewDetailMode(paymentdetailsItemModelObj.paymentMode1!);
              PrefUtils().setViewDetailRefNo("");
              PrefUtils().setViewDetailDate(paymentdetailsItemModelObj.date1!);
              PrefUtils().setViewDetailTime("");

              onTapViewDetails!.call();
            },
          ),
        ],
      ),
    );
  }
}
