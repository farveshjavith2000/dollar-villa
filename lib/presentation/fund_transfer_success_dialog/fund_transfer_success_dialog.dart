import 'bloc/fund_transfer_success_bloc.dart';
import 'models/fund_transfer_success_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FundTransferSuccessDialog extends StatelessWidget {
  const FundTransferSuccessDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FundTransferSuccessBloc>(
      create: (context) => FundTransferSuccessBloc(FundTransferSuccessState(
        fundTransferSuccessModelObj: FundTransferSuccessModel(),
      ))
        ..add(FundTransferSuccessInitialEvent()),
      child: FundTransferSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.h,
      padding: EdgeInsets.symmetric(
        horizontal: 56.h,
        vertical: 55.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder31,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 26.v),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 57.adaptSize,
            width: 57.adaptSize,
          ),
          SizedBox(height: 23.v),
          Text(PrefUtils().getTransactionMessage(),
            style: TextStyle(
              color: appTheme.gray900,
              fontSize: 14.fSize,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 13.v),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
            "lbl_ok".tr,
            style: TextStyle(
              color: theme.colorScheme.secondaryContainer,
              fontSize: 20.fSize,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          )),
        ],
      ),
    );
  }
}
