import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Veify Login".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.veifyLoginScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT -Verify".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.dmtVerifyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT Fund Transfer".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.dmtFundTransferScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT Pin".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.dmtPinScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT History".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.dmtHistoryScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT Success".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.dmtSuccessScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "DMT Failed".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.dmtFailedScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Login Page".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginPageScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Dash board - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.dashBoardContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Create PIN".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.createPinScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Contact US".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.contactUsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Privacy Policy".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.privacyPolicyScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
