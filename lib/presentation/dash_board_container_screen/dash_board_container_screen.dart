import 'package:dollervilla/presentation/add_money_screen/add_money_screen.dart';
import 'package:dollervilla/presentation/my_accout_screen/my_accout_screen.dart';

import '../contact_us_screen/contact_us_screen.dart';
import '../privacy_policy_screen/privacy_policy_screen.dart';
import '../reports_screen/reports_screen.dart';
import 'bloc/dash_board_container_bloc.dart';
import 'models/dash_board_container_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/presentation/dash_board_page/dash_board_page.dart';
import 'package:dollervilla/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DashBoardContainerScreen extends StatelessWidget {
  DashBoardContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DashBoardContainerBloc>(
        create: (context) => DashBoardContainerBloc(DashBoardContainerState(
            dashBoardContainerModelObj: DashBoardContainerModel()))
          ..add(DashBoardContainerInitialEvent()),
        child: DashBoardContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<DashBoardContainerBloc, DashBoardContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.deepPurple50,
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.dashBoardPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {

      case BottomBarEnum.Home:
        print("Type:$type");
        return AppRoutes.dashBoardPage;
      case BottomBarEnum.Wallet:
        print("Type:$type");
        return AppRoutes.addMoneyScreen;
      case BottomBarEnum.History2:
        print("Type:$type");
        return AppRoutes.reportsScreen;
      case BottomBarEnum.Account:
        print("Type:$type");
        return AppRoutes.myAccoutScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.dashBoardPage:
        return DashBoardPage.builder(context);
      case AppRoutes.addMoneyScreen:
        return AddMoneyScreen.builder(context);
      case AppRoutes.reportsScreen:
        return ReportsScreen.builder(context);
      case AppRoutes.myAccoutScreen:
        return MyAccoutScreen.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
