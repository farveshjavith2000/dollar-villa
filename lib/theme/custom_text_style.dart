import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {

  static get bodyMediumMontserrat14 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        fontSize: 14.fSize,
      );
  static get titleSmallPoppinsGray80001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray80001,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsGray70001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray70001,
      );
  static get titleSmallInterBlack900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get bodyMediumMontserrat =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumMontserratRed900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.red900,
        fontSize: 13.fSize,
      );

  static get titleLargeMontserratRed900 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.red900,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumMontserratRed900 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.red900,
        fontSize: 18.fSize,
      );

  static get titleSmallInterGray800 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray800,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratOrangeA200 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.orangeA200,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleSmallInterGray800Bold =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMontserratGreen40001 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.green40001,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleSmallMontserratGray900 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );

  // Body text style
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter.copyWith(
        fontSize: 13.fSize,
      );
  static get titleSmallMontserratBlack900 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
      );
  static get bodyMediumInterGray800 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray800,
        fontSize: 14.fSize,
      );
  static get bodyMediumMontserratBlack900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumMontserratErrorContainer =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumMontserratGreen500 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.green500,
      );
  static get bodyMediumOpenSansErrorContainer =>
      theme.textTheme.bodyMedium!.openSans.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 14.fSize,
      );
  // Label text style
  static get labelLargeInterBlack900 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePoppinsGray80001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeRalewayDeeppurpleA400 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.deepPurpleA400,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeGreen400 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.green400,
      );
  static get titleLargeOpenSansBlack900 =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOrangeA200 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.orangeA200,
      );
  static get titleMediumBlue600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMontserratGray700 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMontserratGray700Medium =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlack900Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack900Medium_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlue600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallCabinTealA400 =>
      theme.textTheme.titleSmall!.cabin.copyWith(
        color: appTheme.tealA400,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallErrorContainerMedium =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallErrorContainerMedium14 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray40002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray40002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 14.fSize,
      );
  static get titleSmallGray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallIndigoA70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.indigoA70001,
      );
  static get titleSmallInter => theme.textTheme.titleSmall!.inter.copyWith(
        fontSize: 14.fSize,
      );
  static get titleSmallInterGray90002 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray90002,
      );
  static get titleSmallInterLightblue900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.lightBlue900,
        fontSize: 14.fSize,
      );
  static get titleSmallGray70002 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray70002,
  );
  static get titleSmallInterOnPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 14.fSize,
      );

  static get labelLargeGray90002 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray90002,
    fontWeight: FontWeight.w700,
  );
  static get titleSmallOpenSansBlack900 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSansBlack90014 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
      );
  static get titleSmallOpenSansBluegray400 =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.blueGray400,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPoppinsGray500 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray500,
        fontSize: 14.fSize,
      );
  static get titleLargeMontserratWhiteA70001 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumMontserratGray900 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );

  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRalewayDeeppurpleA400 =>
      theme.textTheme.titleSmall!.raleway.copyWith(
        color: appTheme.deepPurpleA400,
        fontSize: 14.fSize,
      );
  static get titleSmallWhiteA70001Bold => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA70001,
    fontWeight: FontWeight.w700,
  );
  static get titleSmallGray60001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray60001,
  );
  static get titleSmallWhiteA70001_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA70001,
  );

  static get titleSmallGray70001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray70001,
    fontWeight: FontWeight.w700,
  );

  static get titleSmall14_1 => theme.textTheme.titleSmall!.copyWith(
    fontSize: 14.fSize,
  );

  static get titleSmallCabinWhiteA70001 =>
      theme.textTheme.titleSmall!.cabin.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );

  static get titleSmallGray40001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray40001,
    fontSize: 14.fSize,
  );

  static get titleSmallBlack900_2 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
  );

  static get titleSmall14 => theme.textTheme.titleSmall!.copyWith(
    fontSize: 14.fSize,
  );

  static get titleSmallWhiteA70001Bold_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmall_1 => theme.textTheme.titleSmall!;

  static get titleSmallGray50002 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray50002,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
  );

  static get titleSmallOpenSansBlack900Bold =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray80001 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray80001,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
  );

  static get titleMediumPoppinsGreen500 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.green500,
        fontWeight: FontWeight.w500,
      );

  static get titleLargeOpenSans =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        fontSize: 20.fSize,
      );

  static get labelMediumCabinYellow900 =>
      theme.textTheme.labelMedium!.cabin.copyWith(
        color: appTheme.yellow900,
        fontWeight: FontWeight.w700,
      );

  static get bodyMediumMontserratGray70001 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.gray70001,
      );

  static get titleSmallMontserratWhiteA70001Bold_1 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallMontserratErrorContainer_1 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleSmallMontserratGray70001_1 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.gray70001,
      );

  static get labelLargeInterBlack900Bold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeInterGray50001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray50001,
        fontSize: 12.fSize,
      );

  static get titleMediumMontserratYellow90002 =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: appTheme.yellow90002,
        fontWeight: FontWeight.w700,
      );

  static get labelLargePoppinsGreen500 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.green500,
      );

  static get labelLargePoppinsRed500 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.red500,
      );

  static get titleSmallMontserratGray70001 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.fSize,
      );
  static get titleLargeWhiteA70001 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.whiteA70001,
    fontSize: 18.fSize,
  );

  static get labelMediumInterGray50001 =>
      theme.textTheme.labelMedium!.inter.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w700,
      );

  static get labelLargeInterGray800 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray800,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );

  static get bodySmallInterGray50001 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray50001,
      );

}

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get inder {
    return copyWith(
      fontFamily: 'Inder',
    );
  }

  TextStyle get cabin {
    return copyWith(
      fontFamily: 'Cabin',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
  static OutlineInputBorder get fillGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get fillGrayTL12 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h),
    borderSide: BorderSide.none,
  );


}


