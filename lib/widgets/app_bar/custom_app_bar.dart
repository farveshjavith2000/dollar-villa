import 'package:dollervilla/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 48.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 48.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Container(
          height: 86.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.whiteA70001,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12.h),
            ),
          ),
        );
      case Style.bgFill_2:
        return Stack(
          children: [
            Container(
              height: 56.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.deepPurpleA400,
              ),
            ),
            Container(
              height: 1.v,
              width: 385.h,
              margin: EdgeInsets.fromLTRB(14.h, 51.v, 15.h, 4.v),
              decoration: BoxDecoration(
                color: appTheme.indigoA100,
              ),
            ),
          ],
        );
      case Style.bgFill:
        return Container(
          height: 48.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.deepPurpleA400,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill_1,
  bgFill_2,
  bgFill,
}
