import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body:

                  SingleChildScrollView(
                      child: Container(
                          width: mediaQueryData.size.width,
                          height: mediaQueryData.size.height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0.42, 0.6),
                                  end: Alignment(0.93, 0.06),
                                  colors: [
                                appTheme.redA400,
                                appTheme.purple500,
                                appTheme.indigoA700
                              ])),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(top: 284.v),
                                  child: Column(children: [
                                    SizedBox(height: 5.v),
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgLayerX00201WhiteA70001,
                                        height: 153.v,
                                        width: 258.h)
                                  ])),
                              SizedBox(height: 50.h,),
                              SizedBox(
                                width: 100.h,
                                height: 100.h,
                                child: LoadingIndicator(
                                    indicatorType: Indicator.ballSpinFadeLoader, /// Required, The loading type of the widget
                                    colors: const [Colors.white],       /// Optional, The color collections
                                    strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                                    // backgroundColor: Colors.black,      /// Optional, Background of the widget
                                    pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                                ),
                              )
                            ],
                          )))));
    });
  }
}
