import '../../routes/navigation_args.dart';
import 'bloc/myaccountstatements_filter_bloc.dart';
import 'models/myaccountstatements_filter_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/core/constants/constants.dart';

class myaccountstatementsFilterDialog extends StatefulWidget {
  const myaccountstatementsFilterDialog({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<myaccountstatementsFilterBloc>(
        create: (context) => myaccountstatementsFilterBloc(
            myaccountstatementsFilterState(
                myaccountstatementsFilterModelObj:
                    myaccountstatementsFilterModel()))
          ..add(myaccountstatementsFilterInitialEvent()),
        child: myaccountstatementsFilterDialog());
  }

  @override
  State<myaccountstatementsFilterDialog> createState() =>
      _myaccountstatementsFilterDialogState();
}

class _myaccountstatementsFilterDialogState
    extends State<myaccountstatementsFilterDialog> {
  bool _showTitle = true;
  late String MIN_DATETIME = '2023-01-01';
  late String MAX_DATETIME = '2040-01-01';
  late String INIT_DATETIME = '2024-01-08';
  String _format = 'yyyy-MMMM-dd';

  //DateTime? _dateTime;
  DateTime fromdate = DateTime(DateTime.now().year, DateTime.now().month, 01);
  DateTime todate = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day);

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;

  void _showDateFromPicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text("lbl_from_date".tr,
            style: CustomTextStyles.titleSmallMontserratGray70001),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: fromdate,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        print('onChange');
        PrefUtils().setFilterFromDate(dateTime.toString());
        setState(() {
          fromdate = dateTime;

        });
      },
      onConfirm: (dateTime, List<int> index) {
        print('onConfirm');
        PrefUtils().setFilterFromDate(dateTime.toString());
        setState(() {
          fromdate = dateTime;

        });
      },
    );
  }

  void _showDateToPicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text("lbl_to_date".tr,
            style: CustomTextStyles.titleSmallMontserratGray70001),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: todate,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        print('onChange');
        PrefUtils().setFilterToDate(dateTime.toString());
        setState(() {
          todate = dateTime;

        });
      },
      onConfirm: (dateTime, List<int> index) {
        print('onConfirm');
        PrefUtils().setFilterToDate(dateTime.toString());
        setState(() {
          todate = dateTime;

        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
        width: 389.h,
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 65.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder26),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
                    decoration: AppDecoration.outlineGray500.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20),
                    child: TextButton(
                        onPressed: () {
                          PrefUtils().setFilterFromDate("");
                          _showDateFromPicker();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgUilCalender,
                              height: 27.adaptSize,
                              width: 27.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 5.v)),
                          Padding(
                              padding: EdgeInsets.only(left: 11.h, top: 2.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_from_date".tr,
                                        style: CustomTextStyles
                                            .titleSmallMontserratGray70001),
                                    Text(fromdate.toString().substring(0, 10),
                                        style: CustomTextStyles
                                            .titleSmallMontserratGray70001)
                                  ]))
                        ]))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.v),
                    decoration: AppDecoration.outlineGray500.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20),
                    child: TextButton(
                        onPressed: () {
                          PrefUtils().setFilterToDate("");
                          _showDateToPicker();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgUilCalender,
                              height: 27.adaptSize,
                              width: 27.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 3.v)),
                          Padding(
                              padding: EdgeInsets.only(left: 11.h, top: 2.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_to_date".tr,
                                        style: CustomTextStyles
                                            .titleSmallMontserratGray70001),
                                    Text(todate.toString().substring(0, 10),
                                        style: CustomTextStyles
                                            .titleSmallMontserratGray70001)
                                  ]))
                        ])))
              ]),
              SizedBox(height: 27.v),
              CustomElevatedButton(
                  height: 57.v,
                  text: "lbl_search2".tr,
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientIndigoAToPrimaryDecoration,
                  onPressed: () {
                    searchmyaccountstatementFilterWithNavigationTomyaccountstatementList(
                        context);
                  })
            ]));
  }

  /// Navigates to the myaccountstatementsScreen when the action is triggered.
  searchmyaccountstatementFilterWithNavigationTomyaccountstatementList(
      BuildContext context) {
    /*NavigatorService.pushNamed(AppRoutes.myAccountStatementsDetailScreen, arguments: {
      NavigationArgs.accountnumber: Constants.mobile,
      NavigationArgs.transacionid: "54646456546",
      NavigationArgs.fromdate: "2023-01-01",
      NavigationArgs.todate: "2024-01-01",
      NavigationArgs.customermobile: Constants.mobile
    });*/

    NavigatorService.pushNamed(
      AppRoutes.myAccountStatementsDetailScreen,
    );

  }
}
