import 'bloc/privacy_policy_bloc.dart';
import 'models/privacy_policy_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PrivacyPolicyBloc>(
        create: (context) => PrivacyPolicyBloc(
            PrivacyPolicyState(privacyPolicyModelObj: PrivacyPolicyModel()))
          ..add(PrivacyPolicyInitialEvent()),
        child: PrivacyPolicyScreen());
  }

  @override
  Widget build(BuildContext context) {
    PrivacyApiCall(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_privacy_policy".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(child:Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgVector7,
                      height: 1.v,
                      width: 414.h),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.h, vertical: 43.v),
                      child: Column(children: [
                        Container(
                                width: 362.h,
                                margin: EdgeInsets.only(right: 7.h),
                                child: BlocSelector<PrivacyPolicyBloc,
                                        PrivacyPolicyState, String?>(
                                    selector: (state) => state
                                        .privacyPolicyModelObj!.description,
                                    builder: (context, description) {
                                      return Text(description ?? "",
                                          maxLines: 31,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(height: 1.55));
                                    })),
                        // SizedBox(height: 15.v),
                        // CustomOutlinedButton(
                        //     text: "lbl_read_more".tr,
                        //     margin: EdgeInsets.only(left: 21.h, right: 26.h)),
                        // SizedBox(height: 5.v)
                      ]))
                ])))));
  }

  /// Section Widget


  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://app.victoriaepay.com/Privacy API and triggers a [CreatePrivacyEvent] event on the [PrivacyPolicyBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  PrivacyApiCall(BuildContext context) {
    context.read<PrivacyPolicyBloc>().add(
      CreatePrivacyEvent(
        onCreatePrivacyEventError: () {
          _onSendPrivacyPostRequestEventError(context);
        },
      ),
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onSendPrivacyPostRequestEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<PrivacyPolicyBloc>()
                .postSendPrivacyPostRequestResp
                .status
                .toString() ??
            '');
  }
}
