
import '../../data/models/benificiary/operatormodel.dart';
import '../../routes/navigation_args.dart';

import '../add_beneficiary_screen/models/operator.dart';
import 'bloc/mobile_postpaid_bloc.dart';
import 'models/mobile_postpaid_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/app_bar/appbar_leading_image.dart';
import 'package:dollervilla/widgets/app_bar/appbar_title.dart';
import 'package:dollervilla/widgets/app_bar/custom_app_bar.dart';
import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dollervilla/presentation/recharge_successfully_dialog/recharge_successfully_dialog.dart';
import 'package:dollervilla/presentation/recharge_failed_dialog/recharge_failed_dialog.dart';

// ignore_for_file: must_be_immutable
class MobilePostpaidScreen extends StatelessWidget {
  MobilePostpaidScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Operator databaseUser = new Operator();
  String selectedbankname="";
  String selectedbankid="";
  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<MobilePostpaidBloc>(
        create: (context) => MobilePostpaidBloc(MobilePostpaidState(
            mobilePostpaidModelObj: MobilePostpaidModel(),
            page: arg[NavigationArgs.page]))
          ..add(MobilePostpaidInitialEvent()),
        child: MobilePostpaidScreen());
  }

  @override
  Widget build(BuildContext context) {
    void _onChanged(dynamic val) => PrefUtils().setMobileRerchargetype(val);
    //var appbartitle=context.read<MobilePostpaidBloc>().state.page);
    print(context.read<MobilePostpaidBloc>().state.page);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 41.v),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 104.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgUser,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(left: 11.h, top: 3.v, bottom: 3.v),
                                    child: Text(PrefUtils().getWalletBalance(),
                                        style: CustomTextStyles.titleSmallInterGray90002))
                              ]))),

                      (PrefUtils().getPage()=="lbl_mobile_postpaid")?SizedBox(height: 25.v):SizedBox(),
                      (PrefUtils().getPage()=="lbl_mobile_postpaid")?Container(
                        decoration: BoxDecoration (
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        padding: EdgeInsets.fromLTRB(30.h, 0.h, 0.65.h, 0.h),
                        margin: EdgeInsets.fromLTRB(0.h, 0.h, 0.65.h, 0.h),
                        child:FormBuilderRadioGroup<String>(
                          onChanged: _onChanged,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Prepaid/Postpaid?',
                          hintStyle: TextStyle(color:Colors.black),
                          labelStyle: TextStyle(color:Colors.black,fontSize: 28.0),
                        ),
                        initialValue: null,
                        name: 'postpaid_prepaid',
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: ['Prepaid', 'Postpaid']
                            .map((lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Text(lang,style: TextStyle(color: Colors.black),),
                        ))
                            .toList(growable: false),
                        controlAffinity: ControlAffinity.leading,
                        orientation: OptionsOrientation.wrap,
                      )):SizedBox(),
                      //
                      _buildAddMoneyToWalletFrame(context),

                      SizedBox(height: 25.v),
                      _buildFrame(context),

                      // SizedBox(height: 25.v),
                      //_buildFrameSixtySeven(context),
                      // SizedBox(height: 27.v),
                      _buildFrameSixtySix(context),
                      SizedBox(height: 27.v),
                      CustomElevatedButton(
                          text: "lbl_pay".tr,
                          margin: EdgeInsets.only(right: 9.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            rechargeApiCallForMobile(context);
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 50.v,
        leadingWidth: 25.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 15.h, top: 14.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: context.read<MobilePostpaidBloc>().state.page.toString().tr,
            margin: EdgeInsets.only(left: 13.h)),
        styleType: Style.bgFill);
  }

  /// Section Widget

  /// Section Widget
  Widget _buildAddMoneyToWalletFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Padding(
      //     padding: EdgeInsets.only(left: 9.h),
      //     child: Text("msg_select_bank_name".tr,
      //         style: TextStyle(color: Colors.black))),
      // SizedBox(height: 9.v),

      Container(
        // frame44bFw (1:627)
        margin: EdgeInsets.fromLTRB(0.h, 0.h, 0.18.h, 0.h),
        padding: EdgeInsets.fromLTRB(0.h, 5.8.h, 0.13.h, 0.2.h),
        width: double.infinity,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              // yourphonenumber4vD (1:629)
              child: Container(
                decoration: BoxDecoration (
                  color: Color(0xffebebeb),
                  borderRadius: BorderRadius.circular(20.h),
                ),
                margin: EdgeInsets.fromLTRB(0.h, 0.h, 0.65.h, 0.h),
                child: SizedBox(
                  width: 345.h,
                  height: 60.h,
                  child:  SizedBox(
                      height: 55.0,
                      child: DropdownSearch<OperatorModel>(

                        onChanged: (id) {
                          // setState(() {
                          print("selected bank iiiiid is $id");
                          selectedbankname=id.toString().split("@")[0];
                          selectedbankid=id.toString().split("@")[1];
                          PrefUtils().setSelectOperatorId(selectedbankid);
                          PrefUtils().setSelectOperatorName(selectedbankname);
                          //});
                        },
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        // validator: (value) {
                        //   if ((isNull(value.toString(), isRequired: true))) {
                        //     return "err_msg_please_enter_required".tr;
                        //   }
                        //
                        //   return null;
                        // },
                        asyncItems: (String? filter) => databaseUser.getData(filter),
                        popupProps: PopupPropsMultiSelection.menu(
                          showSelectedItems: true,
                          // constraints: BoxConstraints(
                          //   minWidth: Constants.fem*2,
                          //   minHeight: Constants.fem*2,
                          // ),

                          itemBuilder: _customPopupItemBuilderExample2,
                          showSearchBox: true,



                        ),



                        compareFn: (item, sItem) => item.OperatorId == sItem.OperatorId,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: 'msg_select_operator'.tr,
                            // filled: true,

                            // fillColor: Theme.of(context).inputDecorationTheme.fillColor,

                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.h),
                                borderSide: BorderSide.none
                            ),

                          ),

                        ),

                      )),
                ),
              ),
            ),


          ],
        ),
      )
    ]);
  }

  Widget _customPopupItemBuilderExample2(BuildContext context, OperatorModel item, bool isSelected) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration (
        color: Color(0xffebebeb),
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.OperatorName),
        // subtitle: Text(item.createdAt.toString()),
        /*leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),*/
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text("lbl_enter_number".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<MobilePostpaidBloc, MobilePostpaidState,
                      TextEditingController?>(
                  selector: (state) => state.numbervalueController,
                  builder: (context, numbervalueController) {
                    return CustomTextFormField(
                      nooflength: 10,
                        controller: numbervalueController,
                        hintText: "lbl_number".tr,
                        textInputType: TextInputType.number,
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 19.v, 18.h, 23.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgMditick,
                                height: 22.adaptSize,
                                width: 22.adaptSize)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v),
                        validator: (value) {
                          if (!isNumeric(value)) {
                            return "err_msg_please_enter_valid_number".tr;
                          }
                          if ((isNull(value.toString(), isRequired: true))) {
                            return "err_msg_please_enter_required".tr;
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.only(
                            left: 19.h, top: 22.v, bottom: 22.v));
                  }))
        ]));
  }



  /// Section Widget
  Widget _buildFrameSixtySix(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Text("lbl_enter_amount3".tr,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: BlocSelector<MobilePostpaidBloc, MobilePostpaidState,
                      TextEditingController?>(
                  selector: (state) => state.amountController,
                  builder: (context, amountController) {
                    return CustomTextFormField(
                        controller: amountController,
                        hintText: "lbl_enter_amount2".tr,
                        textInputType: TextInputType.number,
                        hintStyle: CustomTextStyles.titleSmallGray70002,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if ((isNull(value.toString(), isRequired: true))) {
                            return "err_msg_please_enter_required".tr;
                          }

                          return null;
                        },
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 21.v, 20.h, 21.v),
                            child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgTablercoinrupeeGreen400,
                                height: 22.adaptSize,
                                width: 22.adaptSize)),
                        suffixConstraints: BoxConstraints(maxHeight: 64.v));
                  }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://app.victoriaepay.com/MobileRecharge API and triggers a [CreateMobileRechargeEvent] event on the [MobilePostpaidBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  rechargeApiCallForMobile(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MobilePostpaidBloc>().add(
        CreateMobileRechargeEvent(
          onCreateMobileRechargeEventSuccess: () {
            _onMobileRechargePostEventSuccess(context);
          },
          onCreateMobileRechargeEventError: () {
            _onMobileRechargePostEventError(context);
          },
        ),
      );
    }
  }

  /// Displays a dialog with the [RechargeSuccessfullyDialog] content.
  void _onMobileRechargePostEventSuccess(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: RechargeSuccessfullyDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Displays a dialog with the [RechargeFailedDialog] content.
  void _onMobileRechargePostEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: RechargeFailedDialog.builder(context),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
