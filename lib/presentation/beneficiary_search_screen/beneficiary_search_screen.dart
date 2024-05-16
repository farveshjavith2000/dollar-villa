import '../../routes/navigation_args.dart';
import '../beneficiary_search_screen/widgets/userprofilesection_item_widget.dart';
import 'bloc/beneficiary_search_bloc.dart';
import 'models/beneficiary_search_model.dart';
import 'models/userprofilesection_item_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title_image.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:dollervilla/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class BeneficiarySearchScreen extends StatelessWidget {
  const BeneficiarySearchScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<BeneficiarySearchBloc>(
        create: (context) => BeneficiarySearchBloc(BeneficiarySearchState(
            beneficiarySearchModelObj: BeneficiarySearchModel()))
          ..add(BeneficiarySearchInitialEvent()),
        child: BeneficiarySearchScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title:  Text("lbl_money_transfer".tr,
                  style: CustomTextStyles
                      .titleSmallWhiteA70001Bold),
              actions: <Widget>[
                IconButton(
                  icon:  Icon(Icons.add_circle,color: Colors.white,),
                  tooltip: 'Add Beneficiary',
                  onPressed: () {
                    onTapTxtCreatePIN(context);
                  },
                ), //IconButton

              ], //<Widget>[]
              backgroundColor:appTheme.deepPurpleA400,
              elevation: 50.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                tooltip: 'Back',
                onPressed: () {
                  onTapArrowLeft(context);
                },
              ),

            ),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildStackView(context),
                  SizedBox(height: 14.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              height: 600.v,
                              width: 411.h,
                              margin: EdgeInsets.only(right: 3.h),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    _buildUserProfileSection(context),
                                    //_buildItemsSection(context)
                                  ])))),
                  // Text("fdfdfd",style: TextStyle(color: Colors.black),),
                  // Text("fdfdfd",style: TextStyle(color: Colors.black),),
                  // Text("fdfdfd",style: TextStyle(color: Colors.black),),
                ]


                ))));
  }


  /// Section Widget
  Widget _buildStackView(BuildContext context) {
    return SizedBox(
        height: 209.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [

          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 14.v),
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.h, vertical: 33.v),
                  decoration: AppDecoration.fillDeepPurpleA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 15.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(left: 30.h),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 13.v),
                                          child: Text("lbl_name".tr+" : "+PrefUtils().getSenderName(),
                                              style: CustomTextStyles
                                                  .titleSmallWhiteA70001Bold)),

                                    ]))),
                        SizedBox(height: 8.v),
                        Container(
                            width: 300.h,
                            margin: EdgeInsets.only(left: 28.h),
                            child: Text("Phone Number : "+PrefUtils().getSenderNumber()+"\nRemaining Limit : ₹ "+PrefUtils().getSenderRemainingLimit(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleSmallWhiteA70001_1
                                    .copyWith(height: 1.54)))
                      ]))),

          Align(
              alignment: Alignment.bottomCenter,
              child: BlocSelector<BeneficiarySearchBloc, BeneficiarySearchState,
                  TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomSearchView(
                        width: 366.h,
                        controller: searchController,
                        hintText: "lbl_search".tr,
                        alignment: Alignment.bottomCenter);
                  }))
        ]));
  }
  /// Section Widget
  Widget _buildStackOne(BuildContext context) {
    return SizedBox(
        height: 209.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 14.v),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 33.v),
                  decoration: AppDecoration.fillPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 15.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(left: 30.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 13.v),
                                          child: Text("lbl_name".tr,
                                              style: TextStyle(
                                                  color: theme.colorScheme
                                                      .onPrimaryContainer,
                                                  fontSize: 15.fSize,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 4.v),
                                          child: CustomIconButton(
                                              height: 28.adaptSize,
                                              width: 28.adaptSize,
                                              child: CustomImageView()))
                                    ]))),
                        SizedBox(height: 8.v),
                        Container(
                            width: 219.h,
                            margin: EdgeInsets.only(left: 28.h),
                            child: Text("msg_phone_number".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: theme.colorScheme.onPrimaryContainer,
                                    fontSize: 15.fSize,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500)))
                      ]))),

          Align(
              alignment: Alignment.bottomCenter,
              child: BlocSelector<BeneficiarySearchBloc, BeneficiarySearchState,
                      TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomSearchView(
                        width: 366.h,
                        controller: searchController,
                        hintText: "lbl_search".tr,
                        alignment: Alignment.bottomCenter);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {

    //print("Length B:");
   // print(state.beneficiarySearchModelObj?.userprofilesectionItemList.length);
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: BlocSelector<BeneficiarySearchBloc, BeneficiarySearchState,
                    BeneficiarySearchModel?>(
                selector: (state) => state.beneficiarySearchModelObj,
                builder: (context, beneficiarySearchModelObj) {
                  print("Length B:");
                  print(beneficiarySearchModelObj
                      ?.userprofilesectionItemList.length);

                  return (beneficiarySearchModelObj
                      ?.userprofilesectionItemList.length==0)?Text("no_entries_found".tr,style: TextStyle(color: Colors.red),):ListView.separated(
                    //  physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.5.v),
                            child: SizedBox(
                                width: 376.h,
                                child: Divider(
                                    height: 1.v,
                                    thickness: 1.v,
                                    color: appTheme.blueGray100)));
                      },
                      itemCount: beneficiarySearchModelObj
                              ?.userprofilesectionItemList.length ??
                          0,
                      itemBuilder: (context, index) {
                        UserprofilesectionItemModel model =
                            beneficiarySearchModelObj
                                    ?.userprofilesectionItemList[index] ??
                                UserprofilesectionItemModel();
                        return UserprofilesectionItemWidget(model,
                            deleteBeneficiaryApiCall: () {
                          deleteBeneficiaryApiCall(context);
                        }, navigateToFundTransfer: () {
                          navigateToFundTransfer(context,beneficiarySearchModelObj
                              ?.userprofilesectionItemList[index].recipientId,beneficiarySearchModelObj
                              ?.userprofilesectionItemList[index].aaditya,beneficiarySearchModelObj
                              ?.userprofilesectionItemList[index].udf1,beneficiarySearchModelObj
                              ?.userprofilesectionItemList[index].udf2);
                        });
                      });
                })));
  }

  /// Section Widget
  Widget _buildItemsSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 34.v,
            width: 411.h,
            margin: EdgeInsets.only(bottom: 25.v),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(width: 146.h, child: Divider())),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(color: appTheme.blueGray400)))
            ])));
  }

  /// Calls the https://app.victoriaepay.com/Dmt4DeleteBeneficiary API and triggers a [CreateDmt4DeleteBeneficiaryEvent] event on the [BeneficiarySearchBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  deleteBeneficiaryApiCall(BuildContext context) {
    context
        .read<BeneficiarySearchBloc>()
        .add(CreateDmt4DeleteBeneficiaryEvent());

    Fluttertoast.showToast(
        msg: context
            .read<BeneficiarySearchBloc>()
            .postDeleteBeneficiaryResp
            .errorMsg
            .toString() ??
            '');

    var mid = PrefUtils().getMemIdForUserLoggedIn();
    NavigatorService.pushNamed(AppRoutes.beneficiarySearchScreen,
        arguments: {NavigationArgs.memId: mid});


  }

  /// Navigates to the fundTransferScreen when the action is triggered.
  navigateToFundTransfer(BuildContext context,ReceipientId,beneName,account,ifsc) {
    PrefUtils().setFundTranReceipientId(ReceipientId);
    PrefUtils().setFundTranBenName(beneName);
    PrefUtils().setFundTranName(beneName);
    PrefUtils().setFundTranAccountNo(account);
    PrefUtils().setFundTranIFSCNo(ifsc);
    NavigatorService.pushNamed(AppRoutes.dmtFundTransferScreen, arguments: {
      NavigationArgs.data:
          context.read<BeneficiarySearchBloc>().postGetRecipientsListResp.data
    });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }


  /// Navigates to the createPinScreen when the action is triggered.
  onTapTxtCreatePIN(BuildContext context) {
    var mid = PrefUtils().getMemIdForUserLoggedIn();
    NavigatorService.pushNamed(AppRoutes.addBeneficiaryScreen,
        arguments: {NavigationArgs.memId: mid});
  }
}
