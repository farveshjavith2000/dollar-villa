import 'package:flutter/material.dart';
import 'package:dollervilla/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillErrorContainer => BoxDecoration(
    color: theme.colorScheme.errorContainer,
  );
  static BoxDecoration get outlineGray300 => BoxDecoration(
    color: appTheme.whiteA70001,

    border: Border.all(
      color: appTheme.gray300,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineWhiteA70001 => BoxDecoration(
    color: appTheme.green400,
    border: Border.all(
      color: appTheme.whiteA70001,
      width: 1.h,
    ),
  );
  static BoxDecoration get fillGray30001 => BoxDecoration(
    color: appTheme.gray30001,
  );
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.5),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple50,
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA400,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray60001,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );
  static BoxDecoration get fillYellowA => BoxDecoration(
        color: appTheme.yellowA700,
      );

  static BoxDecoration get gradientDeepOrangeToWhiteA => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.54, 0.9),
      end: Alignment(0.35, -0.05),
      colors: [
        appTheme.deepOrange50,
        appTheme.cyan5005,
        appTheme.whiteA70001.withOpacity(0),
      ],
    ),
  );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
  );
  // Gradient decorations
  static BoxDecoration get gradientIndigoAToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.77, 0),
          end: Alignment(0.06, 0.21),
          colors: [
            appTheme.indigoA70002,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientIndigoAToPurpleA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.02, 1.04),
          end: Alignment(0.98, 0.09),
          colors: [
            appTheme.indigoA70002,
            appTheme.purpleA200,
          ],
        ),
      );
  static BoxDecoration get gradientRedAToIndigoA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.42, 0.6),
          end: Alignment(0.93, 0.06),
          colors: [
            appTheme.redA400,
            appTheme.purple500,
            appTheme.indigoA700,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray50001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineTealA => BoxDecoration(
        border: Border.all(
          color: appTheme.tealA400,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineTealA100 => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: appTheme.tealA100,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.whiteA70001,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBlack => BoxDecoration(
    color: appTheme.whiteA70001,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.09),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  static BoxDecoration get outlineGray500 => BoxDecoration(
    border: Border.all(
      color: appTheme.gray500,
      width: 1.h,
    ),
  );
  // Gradient decorations
  static BoxDecoration get gradientDeepOrangeToCyan => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.42, 0.98),
      end: Alignment(0.39, 0.06),
      colors: [
        appTheme.deepOrange50,
        appTheme.whiteA70001.withOpacity(0.46),
        appTheme.cyan5005,
      ],
    ),
  );

  static BoxDecoration get outlineGray200 => BoxDecoration(
    border: Border.all(
      color: appTheme.gray200,
      width: 2.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
  static BoxDecoration get outlineGray30002 => BoxDecoration(
    color: appTheme.whiteA70001,
    border: Border.all(
      color: appTheme.gray30002,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.09),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );

  // Gradient decorations
  static BoxDecoration get gradientDeepOrangeToOnPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.54, 0.9),
          end: Alignment(0.35, -0.05),
          colors: [
            appTheme.deepOrange50,
            appTheme.cyan5005,
            theme.colorScheme.onPrimaryContainer.withOpacity(0),
          ],
        ),
      );

}

class BorderRadiusStyle {

  static BorderRadius get roundedBorder23 => BorderRadius.circular(
    23.h,
  );
  // Custom borders
  static BorderRadius get customBorderBL20 => BorderRadius.vertical(
    bottom: Radius.circular(20.h),
  );
  // Circle borders
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
        bottom: Radius.circular(12.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder26 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );

  static BorderRadius get roundedBorder31 => BorderRadius.circular(
    31.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
