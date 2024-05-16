import 'bloc/contact_us_bloc.dart';
import 'models/contact_us_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ContactUsBloc>(
        create: (context) =>
            ContactUsBloc(ContactUsState(contactUsModelObj: ContactUsModel()))
              ..add(ContactUsInitialEvent()),
        child: ContactUsScreen());
  }

  @override
  Widget build(BuildContext context) {

    launchMailto(mail) async {
      final mailtoLink = Mailto(
        to: ['$mail'],
        // cc: ['cc1@example.com', 'cc2@example.com'],
        subject: '',
        body: '',
      );
      // Convert the Mailto instance into a string.
      // Use either Dart's string interpolation
      // or the toString() method.
      await launch('$mailtoLink');
    }

    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    ContactUsApiCall(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: appTheme.deepPurpleA400,
          title: Text(
            "lbl_contact_us".tr,
            style: TextStyle(color: appTheme.white900),
          ),
          actions: <Widget>[]),
      body: SizedBox(
          width: double.maxFinite,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageView(
                imagePath: ImageConstant.imgVector2, height: 1.v, width: 414.h),
            SizedBox(height: 82.v),
            Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Text("lbl_get_in_touch".tr,
                    style: CustomTextStyles.titleSmallGray50002)),
            SizedBox(height: 47.v),
            Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 54.v),
                          child: CustomIconButton(
                              height: 56.adaptSize,
                              width: 56.adaptSize,
                              padding: EdgeInsets.all(12.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgCall))),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h, top: 6.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Text("lbl_helpline_number".tr,
                                        style: CustomTextStyles
                                            .titleSmallOpenSansBlack900Bold)),
                                SizedBox(height: 4.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: BlocSelector<ContactUsBloc,
                                            ContactUsState, String?>(
                                        selector: (state) =>
                                            state.contactUsModelObj!.widget,
                                        builder: (context, widget) {
                                          return Text(widget ?? "",
                                              style: CustomTextStyles
                                                  .bodyMediumOpenSansErrorContainer);
                                        })),
                                SizedBox(height: 15.v),
                                CustomOutlinedButton(
                                        onPressed: () async {
                                          _makePhoneCall("8928103474");
                                        },
                                        height: 44.v,
                                        width: 110.h,
                                        text: "lbl_call_now".tr,
                                        buttonStyle:
                                            CustomButtonStyles.outlineGray,
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallOpenSansBlack900Bold)
                              ]))
                    ])),
            SizedBox(height: 40.v),
            Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 54.v),
                          child: CustomIconButton(
                              height: 56.adaptSize,
                              width: 56.adaptSize,
                              padding: EdgeInsets.all(11.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgFrame7523))),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h, top: 4.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Text("lbl_reach_us_out_at".tr,
                                        style: CustomTextStyles
                                            .titleSmallOpenSansBlack900Bold)),
                                SizedBox(height: 7.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: BlocSelector<ContactUsBloc,
                                            ContactUsState, String?>(
                                        selector: (state) =>
                                            state.contactUsModelObj!.email,
                                        builder: (context, email) {
                                          return Text(email ?? "",
                                              style: CustomTextStyles
                                                  .bodyMediumOpenSansErrorContainer
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline));
                                        })),
                                SizedBox(height: 13.v),
                                CustomOutlinedButton(
                                    onPressed: () async {
                                      launchMailto('support@dollarvilla.com');
                                    },
                                    height: 44.v,
                                    width: 151.h,
                                    text: "lbl_write_an_email".tr,
                                    buttonStyle: CustomButtonStyles.outlineGray,
                                    buttonTextStyle: CustomTextStyles
                                        .titleSmallOpenSansBlack900Bold)
                              ]))
                    ])),
            SizedBox(height: 40.v),
            Padding(
                padding: EdgeInsets.only(left: 26.h, right: 70.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 48.v),
                          child: CustomIconButton(
                              height: 56.adaptSize,
                              width: 56.adaptSize,
                              padding: EdgeInsets.all(12.h),
                              child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgLocationIndigoA70001))),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h, top: 4.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_address".tr,
                                        style: CustomTextStyles
                                            .titleSmallOpenSansBlack900Bold),
                                    SizedBox(height: 6.v),
                                    SizedBox(
                                        width: 237.h,
                                        child: BlocSelector<ContactUsBloc,
                                                ContactUsState, String?>(
                                            selector: (state) => state
                                                .contactUsModelObj!.description,
                                            builder: (context, description) {
                                              return Text(description ?? "",
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CustomTextStyles
                                                      .bodyMediumOpenSansErrorContainer
                                                      .copyWith(height: 1.29));
                                            }))
                                  ])))
                    ])),
            Spacer(flex: 56),
            Divider(color: appTheme.gray40003),
            SizedBox(height: 33.v),
            Align(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("lbl_more_details".tr,
                      style: CustomTextStyles.labelLargePoppinsGray80001),
                  Padding(
                      padding: EdgeInsets.only(left: 38.h),
                      child:
                          BlocSelector<ContactUsBloc, ContactUsState, String?>(
                              selector: (state) =>
                                  state.contactUsModelObj!.weburl,
                              builder: (context, weburl) {
                                return Text(weburl ?? "",
                                    style: theme.textTheme.labelLarge);
                              }))
                ])),
            Spacer(flex: 43)
          ])),
      //bottomNavigationBar: _buildNavigationBar(context)
    ));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 133.h, right: 133.h, bottom: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Container(
            height: 5.v,
            width: 146.h,
            decoration: AppDecoration.fillWhiteA,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(width: 146.h, child: Divider())),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 146.h,
                      child: Divider(color: appTheme.blueGray40001)))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://app.victoriaepay.com/Contact API and triggers a [CreateContactEvent] event on the [ContactUsBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  ContactUsApiCall(BuildContext context) {
    context.read<ContactUsBloc>().add(
          CreateContactEvent(
            onCreateContactEventSuccess: () {
              // _onSendContactFormRequestEventSuccess(context);
            },
            onCreateContactEventError: () {
              _onSendContactFormRequestEventError(context);
            },
          ),
        );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onSendContactFormRequestEventSuccess(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<ContactUsBloc>()
                .postSendContactFormRequestResp
                .status
                .toString() ??
            '');
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onSendContactFormRequestEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<ContactUsBloc>()
                .postSendContactFormRequestResp
                .status
                .toString() ??
            '');
  }

  onTapTxtWeburl(BuildContext context) {
    // TODO: implement Actions
  }
}
