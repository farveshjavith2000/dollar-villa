import 'package:dollervilla/presentation/my_account_statements_screen/widgets/paymentdetails_item_widget.dart';

import '../../routes/navigation_args.dart';
import '../reports_screen/widgets/paymentdetails_item_widget.dart';
import 'bloc/myaccountstatements_bloc.dart';
import 'models/paymentdetails_item_model.dart';
import 'models/myaccountstatements_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/presentation/myaccountstatements_filter_dialog/myaccountstatements_filter_dialog.dart';

class MyAccountStatementsDetailScreen extends StatelessWidget {
  MyAccountStatementsDetailScreen({Key? key}) : super(key: key);

   DateTime now = DateTime.now();

   var mn=['Jan', 'Feb', 'Mar', 'Apr', 'May','June','July','Aug','Sep','Oct','Nov','Dec'][ DateTime.now().month-1];
   var yr= DateTime.now().year.toString();
   //var currentdatestring='$mn $yr';
  static Widget builder(BuildContext context) {
   /* var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;*/
    return BlocProvider<myaccountstatementsBloc>(
        create: (context) => myaccountstatementsBloc(myaccountstatementsState(
            myaccountstatementsModelObj: myaccountstatementsModel(),
            accountnumber: "",
            transacionid: "",
            fromdate: "",
            todate: "",
            customermobile: ""))
          ..add(myaccountstatementsInitialEvent()),
        child: MyAccountStatementsDetailScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_myaccountstatements".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            backgroundColor: appTheme.gray100,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 846.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 38.v),
                                  decoration:
                                      AppDecoration.gradientDeepOrangeToCyan,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                      child:Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildFrame3(context),
                                        SizedBox(height: 33.v),
                                        _buildViewDetails(context)
                                      ])))),
                       //   _buildArrowLeft(context)
                        ]))))));
  }

  /// Section Widget
  Widget _buildFrame3(BuildContext context) {
    return Container(
      width: 420.h,
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 0.v),
        decoration: AppDecoration.outlineWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBL20),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            (PrefUtils().getFilterFromDate()!='')?Text("From "+PrefUtils().getFilterFromDate().toString().substring(0,10)+" To "+PrefUtils().getFilterToDate().toString().substring(0,10), style: CustomTextStyles.titleSmallGray80001):Text(mn+" "+yr, style: CustomTextStyles.titleSmallGray80001),
          ]),
          SizedBox(width: (PrefUtils().getFilterFromDate()!='')?50:223.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [

                Padding(
                    padding:
                        EdgeInsets.only(left: 13.h, top: 19.v, bottom: 19.v),
                    child: CustomIconButton(
                        height: 36.adaptSize,
                        width: 36.adaptSize,
                        padding: EdgeInsets.all(9.h),
                        decoration: IconButtonStyleHelper.outlineGray,
                        onTap: () {
                          onTapBtnMiFilter(context);
                        },
                        child: CustomImageView(
                            imagePath: ImageConstant.imgMiFilter)))
              ])),
          SizedBox(height: 16.v)
        ]));
  }

  /// Section Widget
  Widget _buildViewDetails(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 18.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Text(mn+" "+yr, style: CustomTextStyles.titleSmallGray80001),
          SizedBox(height: 8.v),
          Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: BlocSelector<myaccountstatementsBloc, myaccountstatementsState, myaccountstatementsModel?>(
                  selector: (state) => state.myaccountstatementsModelObj,
                  builder: (context, myaccountstatementsModelObj) {
                    return ListView.separated(
                       // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0.v),
                              child: SizedBox(
                                  width: 324.h,
                                 /* child: Divider(
                                      height: 1.v,
                                      thickness: 1.v,
                                      color: appTheme.gray40003)*/
                              ));
                        },
                        itemCount:
                            myaccountstatementsModelObj?.paymentdetailsItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          PaymentdetailsItemModel model =
                              myaccountstatementsModelObj?.paymentdetailsItemList[index] ??
                                  PaymentdetailsItemModel();
                          return PaymentdetailsItemWidget(model,
                              onTapViewDetails: () {
                            onTapViewDetails(context);
                          });
                        });
                  }))
        ]));
  }

  /// Section Widget
  // Widget _buildArrowLeft(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //           decoration: AppDecoration.fillWhiteA,
  //           child: Container(
  //               width: double.maxFinite,
  //               padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
  //               decoration: AppDecoration.fillDeepPurpleA,
  //               child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     CustomImageView(
  //                         imagePath: ImageConstant.imgArrowLeft,
  //                         height: 17.v,
  //                         width: 10.h,
  //                         margin: EdgeInsets.only(bottom: 7.v),
  //                         onTap: () {
  //                           onTapImgArrowLeft(context);
  //                         }),
  //                     Padding(
  //                         padding: EdgeInsets.only(left: 12.h, bottom: 3.v),
  //                         child: Text("lbl_myaccountstatements".tr,
  //                             style: theme.textTheme.bodyMedium))
  //                   ]))));
  // }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String vector,
    required String dMTCounter,
    required String myaccountstatement,
  }) {
    return  Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.v),
            decoration: AppDecoration.outlineGray300
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: vector,
                  height: 15.v,
                  width: 12.h,
                  margin: EdgeInsets.symmetric(vertical: 12.v)),
              Padding(
                  padding: EdgeInsets.only(left: 10.h, top: 2.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(dMTCounter,
                                style: CustomTextStyles.titleSmallInterBlack900
                                    .copyWith(color: appTheme.black900))),
                        SizedBox(height: 2.v),
                        Align(
                            alignment: Alignment.center,
                            child: Text(myaccountstatement,
                                style: CustomTextStyles
                                    .titleSmallMontserratBlack900
                                    .copyWith(color: appTheme.black900)))
                      ]))
            ]));
  }

  /// Navigates to the myaccountstatementsDetailScreen when the action is triggered.
  onTapViewDetails(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.reportsDetailScreen);
  }

  /// Displays a dialog with the [myaccountstatementsFilterDialog] content.
  onTapBtnMiFilter(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: myaccountstatementsFilterDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
