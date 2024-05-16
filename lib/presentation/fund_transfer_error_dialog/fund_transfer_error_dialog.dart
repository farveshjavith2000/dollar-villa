import 'bloc/fund_transfer_error_bloc.dart';
import 'models/fund_transfer_error_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FundTransferErrorDialog extends StatelessWidget {
  const FundTransferErrorDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FundTransferErrorBloc>(
      create: (context) => FundTransferErrorBloc(FundTransferErrorState(
        fundTransferErrorModelObj: FundTransferErrorModel(),
      ))
        ..add(FundTransferErrorInitialEvent()),
      child: FundTransferErrorDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.h,
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
            child: Text(PrefUtils().getTransactionMessage(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appTheme.gray70001,
                fontSize: 14.fSize,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 46.v),
          Divider(
            color: appTheme.gray400,
            endIndent: 10.h,
          ),
          SizedBox(height: 22.v),
          Padding(
            padding: EdgeInsets.only(left: 158.h),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "lbl_ok".tr,
                  style: TextStyle(
                    color: appTheme.orangeA200,
                    fontSize: 20.fSize,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
