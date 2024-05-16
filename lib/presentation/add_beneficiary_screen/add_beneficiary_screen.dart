import '../../data/models/benificiary/models.dart';
import 'bloc/add_beneficiary_bloc.dart';
import 'models/add_beneficiary_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';

import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'models/user.dart';

// ignore_for_file: must_be_immutable
class AddBeneficiaryScreen extends StatelessWidget {
  AddBeneficiaryScreen({Key? key}) : super(key: key);
  User databaseUser = new User();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedbankname="";
  String selectedbankid="";
  static Widget builder(BuildContext context) {
    return BlocProvider<AddBeneficiaryBloc>(
        create: (context) => AddBeneficiaryBloc(
            AddBeneficiaryState(addBeneficiaryModelObj: AddBeneficiaryModel()))
          ..add(AddBeneficiaryInitialEvent()),
        child: AddBeneficiaryScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "msg_add_bank_details".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: 401.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 0.v),
                    child: Column(children: [
                      SizedBox(
                          height: 644.v,
                          width: 347.h,
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 87.h, top: 193.v),
                                    child: Text("msg_add_money_to_wallet".tr,
                                        style: CustomTextStyles
                                            .titleSmallWhiteA70001Bold_1))),
                            Align(
                                alignment: Alignment.center,
                                child: SingleChildScrollView(child:Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildAddMoneyToWalletFrame(context),
                                      SizedBox(height: 21.v),
                                      _buildAccountHolderNameFrame(context),
                                      SizedBox(height: 24.v),
                                      _buildEnterIFSCCodeFrame(context),
                                      SizedBox(height: 24.v),
                                      _buildEnterAccountNumberFrame(context),
                                      SizedBox(height: 21.v),
                                      _buildEnterConfirmAccountFrame(context)
                                    ])))
                          ])),
                      SizedBox(height: 35.v),
                      CustomElevatedButton(
                          text: "lbl_submit".tr,
                          margin: EdgeInsets.only(left: 6.h),
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientIndigoAToPrimaryDecoration,
                          onPressed: () {
                            addBeneficiaryApiCall(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))),
            bottomNavigationBar: _buildItemsStack(context)));
  }

  /// Section Widget

  Widget _customPopupItemBuilderExample2(BuildContext context, BenificiaryModel item, bool isSelected) {

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
        title: Text(item.name),
        // subtitle: Text(item.createdAt.toString()),
        /*leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),*/
      ),
    );
  }
  /// Section Widget
  Widget _buildAddMoneyToWalletFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Text("msg_select_bank_name".tr,
              style: TextStyle(color: Colors.black))),
      SizedBox(height: 9.v),
      /*BlocSelector<AddBeneficiaryBloc, AddBeneficiaryState,
              TextEditingController?>(
          selector: (state) => state.nameController,
          builder: (context, nameController) {
            return CustomTextFormField(
                controller: nameController,
                hintText: "msg_select_bank_name".tr,
                validator: (value) {
                  // if (!isText(value)) {
                  //   return "err_msg_please_enter_valid_text".tr;
                  // }
                  // return null;
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.h, vertical: 22.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL12,
                filled: true,
                fillColor: appTheme.gray200);
          })*/

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
                  borderRadius: BorderRadius.circular(10.h),
                ),
                margin: EdgeInsets.fromLTRB(0.h, 0.h, 0.65.h, 0.h),
                child: SizedBox(
                  width: 345.h,
                  height: 60.h,
                  child:  SizedBox(
                      height: 55.0,
                      child: DropdownSearch<BenificiaryModel>(

                        onChanged: (id) {
                         // setState(() {
                            print("selected bank iiiiid is $id");
                            selectedbankname=id.toString().split("@")[0];
                            selectedbankid=id.toString().split("@")[1];
                            PrefUtils().setSelectBankId(selectedbankid);
                            PrefUtils().setSelectBankName(selectedbankname);
                          //});
                        },
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



                        compareFn: (item, sItem) => item.id == sItem.id,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: 'Select Bank Name',
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

  /// Section Widget
  Widget _buildAccountHolderNameFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_account_holder_name".tr,
        style: TextStyle(color: Colors.black)),
      SizedBox(height: 9.v),
      BlocSelector<AddBeneficiaryBloc, AddBeneficiaryState,
              TextEditingController?>(
          selector: (state) => state.nameController1,
          builder: (context, nameController1) {
            return CustomTextFormField(
                controller: nameController1,
                hintText: "msg_account_holder_name".tr,
                hintStyle: CustomTextStyles.titleSmallGray700,
                validator: (value) {
                  // if (!isText(value)) {
                  //   return "err_msg_please_enter_valid_text".tr;
                  // }
                  return null;
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 7.h, vertical: 22.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL12,
                filled: true,
                fillColor: appTheme.gray200);
          })
    ]);
  }

  /// Section Widget
  Widget _buildEnterIFSCCodeFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_enter_ifsc_code".tr,
        style: TextStyle(color: Colors.black)),
      SizedBox(height: 4.v),
      BlocSelector<AddBeneficiaryBloc, AddBeneficiaryState,
              TextEditingController?>(
          selector: (state) => state.iFSCCodeController,
          builder: (context, iFSCCodeController) {
            return CustomTextFormField(
                controller: iFSCCodeController,
                hintText: "lbl_ifsc_code".tr,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.h, vertical: 22.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL12,
                filled: true,
                fillColor: appTheme.gray200);
          })
    ]);
  }

  /// Section Widget
  Widget _buildEnterAccountNumberFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_enter_account_number".tr,
        style: TextStyle(color: Colors.black)),
      SizedBox(height: 4.v),
      BlocSelector<AddBeneficiaryBloc, AddBeneficiaryState,
              TextEditingController?>(
          selector: (state) => state.enterAccountNumbervalueController,
          builder: (context, enterAccountNumbervalueController) {
            return CustomTextFormField(
                controller: enterAccountNumbervalueController,
                hintText: "msg_enter_account_number".tr,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (!isNumeric(value)) {
                    return "err_msg_please_enter_valid_number".tr;
                  }
                  return null;
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.h, vertical: 22.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL12,
                filled: true,
                fillColor: appTheme.gray200);
          })
    ]);
  }

  /// Section Widget
  Widget _buildEnterConfirmAccountFrame(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("msg_enter_confirm_account".tr,
          style: TextStyle(color: Colors.black))),
      SizedBox(height: 9.v),
      BlocSelector<AddBeneficiaryBloc, AddBeneficiaryState,
              TextEditingController?>(
          selector: (state) => state.enterConfirmAccountNumbervalueController,
          builder: (context, enterConfirmAccountNumbervalueController) {
            return CustomTextFormField(
                controller: enterConfirmAccountNumbervalueController,
                hintText: "msg_enter_confirm_account".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (!isNumeric(value)) {
                    return "err_msg_please_enter_valid_number".tr;
                  }
                  return null;
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 9.h, vertical: 22.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL12,
                filled: true,
                fillColor: appTheme.gray200);
          })
    ]);
  }

  /// Section Widget
  Widget _buildItemsStack(BuildContext context) {
    return Container(
        height: 5.v,
        width: 142.h,
        margin: EdgeInsets.only(left: 129.h, right: 129.h, bottom: 8.v),
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(width: 142.h, child: Divider())),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 142.h, child: Divider(color: appTheme.blueGray40001)))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Calls the https://app.victoriaepay.com/Dmt4AddNewBeneficiary API and triggers a [CreateDmt4AddNewBeneficiaryEvent] event on the [AddBeneficiaryBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateDmt4AddNewBeneficiaryEvent] event on the [AddBeneficiaryBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  addBeneficiaryApiCall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AddBeneficiaryBloc>().add(
            CreateDmt4AddNewBeneficiaryEvent(
              onCreateDmt4AddNewBeneficiaryEventSuccess: () {
                _onAddNewBeneficiaryEventSuccess(context);
              },
              onCreateDmt4AddNewBeneficiaryEventError: () {
                _onAddNewBeneficiaryEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the beneficiarySearchScreen when the action is triggered.
  void _onAddNewBeneficiaryEventSuccess(BuildContext context) {

    Fluttertoast.showToast(
        msg: context
            .read<AddBeneficiaryBloc>()
            .postAddNewBeneficiaryResp
            .errorMsg
            .toString() ??
            '');

    NavigatorService.pushNamed(
      AppRoutes.beneficiarySearchScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onAddNewBeneficiaryEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<AddBeneficiaryBloc>()
                .postAddNewBeneficiaryResp
                .errorMsg
                .toString() ??
            '');
  }
}
