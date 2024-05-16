import 'dart:ui';
import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Gradient button style
  static BoxDecoration get gradientIndigoAToPrimaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          begin: Alignment(0.77, 0),
          end: Alignment(0.06, 0),
          colors: [
            appTheme.indigoA70002,
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientIndigoAToPrimaryTL30Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.77, 0),
          end: Alignment(0.06, 0),
          colors: [
            appTheme.indigoA70002,
            theme.colorScheme.primary,
          ],
        ),
      );

  // Outline button style
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
        backgroundColor: appTheme.whiteA70001,
        side: BorderSide(
          color: appTheme.gray600,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      );
  static ButtonStyle get outlineTealA => OutlinedButton.styleFrom(
        backgroundColor: appTheme.whiteA70001,
        side: BorderSide(
          color: appTheme.tealA400,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );

  static BoxDecoration get gradientIndigoAToPrimaryTL24Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0.77, 0),
          end: Alignment(0.06, 0),
          colors: [
            appTheme.indigoA70002,
            theme.colorScheme.primary,
          ],
        ),
      );

  static ButtonStyle get outlineYellow => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.yellow900,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.h),
    ),
  );
}
