import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/apiClient/api_client.dart';
import '/core/app_export.dart';
import 'package:dollervilla/presentation/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

/// A bloc that manages the state of a Splash according to the event that is dispatched to it.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      if (!await NetworkInfo().isConnected()) {
        NavigatorService.popAndPushNamed(
          AppRoutes.noInternetScreen,
        );
      }else {
        print("Loggedin......");
        print(PrefUtils().getMemIdForUserLoggedIn());
        if (PrefUtils().getMemIdForUserLoggedIn() != '') {
          NavigatorService.popAndPushNamed(
            AppRoutes.dashBoardContainerScreen,
          );
        } else {
          NavigatorService.popAndPushNamed(
            AppRoutes.loginPageScreen,
          );
        }
      }
    });
  }
}
