import 'bloc/my_accout_bloc.dart';
import 'models/my_accout_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class MyAccoutScreen extends StatelessWidget {
  const MyAccoutScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MyAccoutBloc>(
      create: (context) => MyAccoutBloc(MyAccoutState(
        myAccoutModelObj: MyAccoutModel(),
      ))
        ..add(MyAccoutInitialEvent()),
      child: MyAccoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAccoutBloc, MyAccoutState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_myaccount".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: SizedBox(
              width: double.maxFinite,
              //child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVector1x414,
                      height: 1.v,
                      width: 414.h,
                    ),
                    SizedBox(height: 10.v),
                    _buildMegaphoneRow(context),
                    SizedBox(height: 5.v),
                    SizedBox(
                      height: 650.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(left: 7.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.h,
                               // vertical: 31.v,
                              ),
                              decoration: AppDecoration
                                  .gradientDeepOrangeToOnPrimaryContainer,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgEllipse39192x189,
                                    height: 180.v,
                                    width: 140.h,
                                    radius: BorderRadius.circular(
                                      120.h,
                                    ),
                                  ),
                                  SizedBox(height: 28.v),
                                  _buildProfileDetailsColumn(context),
                                  SizedBox(height: 15.v),
                                  _buildVerifyRow(context),
                                  SizedBox(height: 15.v),
                                ],
                              ),
                            ),
                          ),
                          //_buildItemsStack(context),
                        ],
                      ),
                    ),
                  ],
                ),
            //  ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMegaphoneRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 6.h,
        right: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMegaphone,
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
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPrinter,
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
  Widget _buildProfileDetailsColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8.h,
        right: 3.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "lbl_profile_details".tr,
                    style: TextStyle(
                      color: appTheme.blue600,
                      fontSize: 16.356435775756836.fSize,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgTelevisionGray60001,
                  height: 23.v,
                  width: 61.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 3.v),
          Text(
            "lbl_agent_name".tr,
            style: TextStyle(
              color: appTheme.black900,
              fontSize: 20.fSize,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "lbl_sv_super_market".tr,
            style: TextStyle(
              color: appTheme.blueGray400,
              fontSize: 14.fSize,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "lbl_91_9987654321".tr,
            style: TextStyle(
              color: appTheme.blueGray400,
              fontSize: 14.fSize,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildVerifyRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 9.v,
              bottom: 6.v,
            ),
            child: Text(
              "msg_svssupermarket_gmail_com".tr,
              style: TextStyle(
                color: appTheme.black900,
                fontSize: 14.fSize,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CustomOutlinedButton(
            width: 94.h,
            text: "lbl_verify".tr,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildItemsStack(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 34.v,
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 57.v),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 146.h,
                child: Divider(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 146.h,
                child: Divider(
                  color: appTheme.blueGray40001,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
