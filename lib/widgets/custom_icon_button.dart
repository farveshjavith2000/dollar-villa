import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.gray100,
                  borderRadius: BorderRadius.circular(16.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA70001,
    borderRadius: BorderRadius.circular(12.h),
  );
  static BoxDecoration get fillYellowA => BoxDecoration(
    color: appTheme.yellowA700,
    borderRadius: BorderRadius.circular(20.h),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: appTheme.whiteA70001,
    borderRadius: BorderRadius.circular(18.h),
    border: Border.all(
      color: appTheme.gray200,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineGrayTL22 => BoxDecoration(
    color: appTheme.whiteA70001,
    borderRadius: BorderRadius.circular(22.h),
    border: Border.all(
      color: appTheme.gray30002,
      width: 1.h,
    ),
  );


  static BoxDecoration get fillOnPrimaryContainerTL24 => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
    borderRadius: BorderRadius.circular(24.h),
  );
}





