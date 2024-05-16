import 'dart:ffi';

import '../../routes/navigation_args.dart';
import 'bloc/reports_filter_bloc.dart';
import 'models/reports_filter_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/core/constants/constants.dart';

class ReportsFilterDialog extends StatefulWidget {
  const ReportsFilterDialog({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportsFilterBloc>(
        create: (context) => ReportsFilterBloc(
            ReportsFilterState(reportsFilterModelObj: ReportsFilterModel()))
          ..add(ReportsFilterInitialEvent()),
        child: ReportsFilterDialog());
  }

  @override
  State<ReportsFilterDialog> createState() => _ReportsFilterDialogState();
}

class _ReportsFilterDialogState extends State<ReportsFilterDialog> {
  // final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  // final _accnoFieldKey = GlobalKey<FormBuilderFieldState>();
  // final _transactionFieldKey = GlobalKey<FormBuilderFieldState>();

  final _formKey = GlobalKey<FormBuilderState>();
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
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 45.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder26),
        child: FormBuilder(
            key: _formKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: BlocSelector<ReportsFilterBloc, ReportsFilterState,
                              TextEditingController?>(
                          selector: (state) => state.mobileNumberController,
                          builder: (context, mobileNumberController) {
                            return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.h, vertical: 8.v),
                                    decoration: AppDecoration.outlineGray500
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder20),
                                    child: FormBuilderTextField(
                                      onChanged: (value) {
                                        PrefUtils().setFilterCustomerMobile(value.toString());
                                      },
                                      //key: _accnoFieldKey,
                                      name: 'mobile',
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h),
                                              borderSide: BorderSide.none),
                                          //labelText: "msg_enter_account_no".tr,
                                          hintText: "msg_customer_mobile".tr,
                                          hintStyle: CustomTextStyles
                                              .titleSmallMontserratGray70001_1,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 25.h, vertical: 5.v)),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                    )) /*CustomTextFormField(
                                controller: mobileNumberController,
                                hintText: "msg_customer_mobile".tr,
                                hintStyle: CustomTextStyles
                                    .titleSmallMontserratGray70001_1,
                                textInputType: TextInputType.phone,
                                validator: (value) {
                                  if (!isValidPhone(value)) {
                                    return "err_msg_please_enter_valid_phone_number"
                                        .tr;
                                  }
                                  return null;
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25.h, vertical: 19.v))*/
                                ;
                          })),
                  SizedBox(height: 20.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: BlocSelector<ReportsFilterBloc, ReportsFilterState,
                              TextEditingController?>(
                          selector: (state) => state.enterAccountNoController,
                          builder: (context, enterAccountNoController) {
                            return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.h, vertical: 8.v),
                                    decoration: AppDecoration.outlineGray500
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder20),
                                    child: FormBuilderTextField(
                                      onChanged: (value) {
                                        PrefUtils().setFilterCustomerAccNo(value.toString());
                                      },
                                      name: 'account_no',
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.h),
                                              borderSide: BorderSide.none),
                                          //labelText: "msg_enter_account_no".tr,
                                          hintText: "msg_enter_account_no".tr,
                                          hintStyle: CustomTextStyles
                                              .titleSmallMontserratGray70001_1,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 25.h, vertical: 5.v)),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                    )) /*CustomTextFormField(
                            controller: enterAccountNoController,
                            hintText: "msg_enter_account_no".tr,
                            hintStyle:
                                CustomTextStyles.titleSmallMontserratGray70001_1,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25.h, vertical: 19.v))*/
                                ;
                          })),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: BlocSelector<ReportsFilterBloc, ReportsFilterState,
                              TextEditingController?>(
                          selector: (state) => state.enterTIDController,
                          builder: (context, enterTIDController) {
                            return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.h, vertical: 8.v),
                                decoration: AppDecoration.outlineGray500
                                    .copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder20),
                                child: FormBuilderTextField(
                                  onChanged: (value) {
                                    PrefUtils().setFilterCustomerTransactionId(value.toString());
                                  },
                                  name: 'transaction_id',
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.h),
                                          borderSide: BorderSide.none),
                                      //labelText: "msg_enter_account_no".tr,
                                      hintText: "lbl_enter_tid".tr,
                                      hintStyle: CustomTextStyles
                                          .titleSmallMontserratGray70001_1,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 25.h, vertical: 5.v)),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                ))/*CustomTextFormField(
                                controller: enterTIDController,
                                hintText: "lbl_enter_tid".tr,
                                hintStyle: CustomTextStyles
                                    .titleSmallMontserratGray70001_1,
                                textInputAction: TextInputAction.done,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25.h, vertical: 19.v))*/;
                          })),
                  SizedBox(height: 25.v),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 0.v),
                            // decoration: AppDecoration.outlineGray500.copyWith(
                            //     borderRadius: BorderRadiusStyle.roundedBorder20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.h, vertical: 8.v),
                                      decoration: AppDecoration.outlineGray500
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder20),
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
                                                imagePath: ImageConstant
                                                    .imgUilCalender,
                                                height: 27.adaptSize,
                                                width: 27.adaptSize,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.v)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 11.h, top: 2.v),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("lbl_from_date".tr,
                                                          style: CustomTextStyles
                                                              .titleSmallMontserratGray70001),
                                                      Text(
                                                          fromdate
                                                              .toString()
                                                              .substring(0, 10),
                                                          style: CustomTextStyles
                                                              .titleSmallMontserratGray70001)
                                                    ]))
                                          ]))),
                                  SizedBox(
                                    width: 20.h,
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.h, vertical: 10.v),
                                      decoration: AppDecoration.outlineGray500
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder20),
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
                                                imagePath: ImageConstant
                                                    .imgUilCalender,
                                                height: 27.adaptSize,
                                                width: 27.adaptSize,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 3.v)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 11.h, top: 2.v),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("lbl_to_date".tr,
                                                          style: CustomTextStyles
                                                              .titleSmallMontserratGray70001),
                                                      Text(
                                                          todate
                                                              .toString()
                                                              .substring(0, 10),
                                                          style: CustomTextStyles
                                                              .titleSmallMontserratGray70001)
                                                    ]))
                                          ])))
                                ])),
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
                        print("Mobile");
                        print(_formKey.currentState?.value['mobile'].toString());
                        print("Account No");
                        print(_formKey.currentState?.value['account_no'].toString());
                        print("Transaction Id");
                        print(_formKey.currentState?.value['transaction_id'].toString());

                        searchReportFilterWithNavigationToReportList(context);
                      })
                ])));
  }

  /// Navigates to the reportsScreen when the action is triggered.
  searchReportFilterWithNavigationToReportList(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.reportsScreen, arguments: {
      NavigationArgs.accountnumber: Constants.mobile,
      NavigationArgs.transacionid: "54646456546",
      NavigationArgs.fromdate: "2023-01-01",
      NavigationArgs.todate: "2024-01-01",
      NavigationArgs.customermobile: Constants.mobile
    });
  }
}
