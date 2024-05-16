import '../notification_screen/widgets/userprofilelist_item_widget.dart';
import 'bloc/notification_bloc.dart';
import 'models/notification_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
            NotificationState(notificationModelObj: NotificationModel()))
          ..add(NotificationInitialEvent()),
        child: NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_notification".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),

            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgVector9,
                      height: 1.v,
                      width: 414.h),
                  Expanded(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13.v),
                              child: Column(children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 22.h),
                                    child: BlocSelector<
                                            NotificationBloc,
                                            NotificationState,
                                            TextEditingController?>(
                                        selector: (state) =>
                                            state.searchController,
                                        builder: (context, searchController) {
                                          return CustomSearchView(
                                              controller: searchController,
                                              hintText: "lbl_search2".tr,
                                              contentPadding: EdgeInsets.only(
                                                  top: 12.v,
                                                  right: 30.h,
                                                  bottom: 12.v));
                                        })),
                                SizedBox(height: 19.v),
                                _buildSearchFrame(context),
                                SizedBox(height: 26.v),
                                _buildUserProfileList(context)
                              ]))))
                ]))));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildSearchFrame(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(left: 23.h, right: 26.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("lbl_all".tr,
                style: CustomTextStyles.labelLargeInterBlack900Bold),
            Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Text("lbl_payments".tr,
                    style: CustomTextStyles.labelLargeInterGray50001)),
            Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Text("lbl_bill".tr,
                    style: CustomTextStyles.labelLargeInterGray50001)),
            Spacer(),
            Text("lbl_mark_all_read".tr,
                style: CustomTextStyles.labelLargeInterGray50001)
          ])),
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: 2.v,
              width: 24.h,
              margin: EdgeInsets.only(left: 22.h),
              decoration: BoxDecoration(color: appTheme.deepPurpleA400))),
      SizedBox(height: 5.v),
      Divider(color: appTheme.gray40003)
    ]);
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.h),
            child: BlocSelector<NotificationBloc, NotificationState,
                    NotificationModel?>(
                selector: (state) => state.notificationModelObj,
                builder: (context, notificationModelObj) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 18.v);
                      },
                      itemCount: notificationModelObj
                              ?.userprofilelistItemList.length ??
                          0,
                      itemBuilder: (context, index) {
                        UserprofilelistItemModel model = notificationModelObj
                                ?.userprofilelistItemList[index] ??
                            UserprofilelistItemModel();
                        return UserprofilelistItemWidget(model);
                      });
                })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
