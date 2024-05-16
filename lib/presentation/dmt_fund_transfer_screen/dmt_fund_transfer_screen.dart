import 'dart:ffi';

import 'package:flutter_svg/svg.dart';

import '../../routes/navigation_args.dart';
import 'bloc/dmt_fund_transfer_bloc.dart';
import 'models/dmt_fund_transfer_model.dart';
import 'package:dollervilla/core/app_export.dart';

import 'package:dollervilla/widgets/custom_drop_down.dart';
import 'package:dollervilla/widgets/custom_elevated_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class DmtFundTransferScreen extends StatelessWidget {
  DmtFundTransferScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<DmtFundTransferBloc>(
        create: (context) => DmtFundTransferBloc(DmtFundTransferState(
            dmtFundTransferModelObj: DmtFundTransferModel(),
            member_id: arg[NavigationArgs.memberId],
            moveType: arg[NavigationArgs.moveType],
            recipient_id: arg[NavigationArgs.recipientId],
            BeneName: arg[NavigationArgs.beneName],
            Ifsc: arg[NavigationArgs.ifsc],
            amount: arg[NavigationArgs.amount],
            transmode: arg[NavigationArgs.transmode],
            bname: arg[NavigationArgs.bname],
            account: arg[NavigationArgs.account],
            recipient_mobile: arg[NavigationArgs.recipientMobile],
            name: arg[NavigationArgs.name],
            userid: arg[NavigationArgs.userid],
            mobile: arg[NavigationArgs.mobile]))
          ..add(DmtFundTransferInitialEvent()),
        child: DmtFundTransferScreen());
  }

  @override
  Widget build(BuildContext context) {
    print("beneName:");
    print(NavigationArgs.beneName);
    print("Account:");
    print(NavigationArgs.account);
    print("recipientId:");

    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:  AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: appTheme.deepPurpleA400,
                title:  Text( "lbl_money_transfer".tr,style: TextStyle(color: appTheme.white900),),
                actions: <Widget>[]
            ),
            body: Form(
    key: _formKey,
    child:SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 37.v),
                    child: SizedBox(
                        height: 770.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 25.v),
                                  decoration:
                                      AppDecoration.fillOnPrimaryContainer,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 534.v),
                                        Text(
                                            "lbl_name".tr +
                                                " : " +
                                                PrefUtils().getSenderName(),
                                            style: CustomTextStyles
                                                .titleSmallBlack900),
                                        SizedBox(height: 6.v),
                                        SizedBox(
                                            width: 218.h,
                                            child: Text(
                                                "Phone Number : " +
                                                    PrefUtils()
                                                        .getSenderNumber() +
                                                    "\nRemaining Limit : ₹ " +
                                                    PrefUtils()
                                                        .getSenderRemainingLimit(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleSmallBlack900_2)),
                                        SizedBox(height: 29.v),
                                        //_buildClientNameItems(context)
                                      ]))),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 87.v,
                                  width: 376.h,
                                  decoration: BoxDecoration(
                                      color: appTheme.whiteA70001,
                                      borderRadius:
                                          BorderRadius.circular(15.h)))),
                          _buildFrame(context)
                        ])))))));
  }

  /// Section Widget




  /// Section Widget
  Widget _buildClientNameItems(BuildContext context) {
    return Container(
        height: 34.v,
        width: 412.h,
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(width: 146.h, child: Divider())),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: 146.h, child: Divider(color: appTheme.blueGray40001)))
        ]));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    var genderOptions = const ['NEFT', 'IMPS'];
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.only(left: 17.h, top: 56.v, right: 14.h),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder31),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 27.adaptSize,
                    width: 27.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 11.h, top: 3.v, bottom: 3.v),
                    child: Text(PrefUtils().getWalletBalance(),
                        style: CustomTextStyles.titleSmallInterGray90002))
              ]),
              SizedBox(height: 15.v),
              Text("lbl_enter_amount".tr, style: theme.textTheme.titleLarge),
              SizedBox(height: 28.v),
              BlocSelector<DmtFundTransferBloc, DmtFundTransferState,
                      DmtFundTransferModel?>(
                  selector: (state) => state.dmtFundTransferModelObj,
                  builder: (context, dmtFundTransferModelObj) {
                    return SizedBox(
                            width: 345.h,
                            height: 64.h,
                            child: FormBuilderDropdown<String>(
                              name: 'transactiontype',
                              // decoration: InputDecoration(
                              //
                              //   hintText: 'Select Transaction Type',
                              //
                              //   border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10.h),
                              //       borderSide: BorderSide.none),
                              // ),

                        decoration: InputDecoration(
                          hintText: 'Select Transaction Type',
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                    ),),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required()
                              ]),
                              items: genderOptions
                                  .map((gender) => DropdownMenuItem(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                print(val);
                                PrefUtils().setFundTranMode(val.toString());
                              },
                              valueTransformer: (val) => val?.toString(),
                            )) /*CustomDropDown(
                        icon: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 19.v, 26.h, 20.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgArrowdown,
                                height: 25.adaptSize,
                                width: 25.adaptSize)),
                        hintText: "msg_transaction_types".tr,
                        items: genderOptions
                            .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.topStart,
                          value: gender,
                          child: Text(gender),
                        ))
                            .toList(),
                        onChanged: (value) {
                          context
                              .read<DmtFundTransferBloc>()
                              .add(ChangeDropDownEvent(value: value));
                        })*/
                        ;
                  }),
              SizedBox(height: 34.v),
              BlocSelector<DmtFundTransferBloc, DmtFundTransferState,
                      TextEditingController?>(
                  selector: (state) => state.amountController,
                  builder: (context, amountController) {
                    return FormBuilderTextField(
                      name: 'amount',
                      initialValue: '',

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Enter Amount",
                        isDense: true,
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 2.h,
                          minHeight: 2.h,
                        ),
                        suffixIcon: InkWell(
                            child: new Padding(
                              padding: EdgeInsets.all(5.0.h),
                              child: new SizedBox(
                                height: 20.h,
                                child: SvgPicture.asset(
                                    "assets/images/mdi_tick.svg"),
                              ),
                            ),
                            onTap: () {
                              print('ticked');
                            }),
                        prefixIcon: new Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12, bottom: 12),
                          child: new SizedBox(
                            height: 10,
                            child: SizedBox(
                              height: 10,
                              width: 10,
                              child: FloatingActionButton(
                                mini: false,
                                backgroundColor: Colors.white,
                                splashColor: Colors.black,
                                onPressed: () {
                                  //logOutDialog(context);
                                },
                                hoverElevation: 0.5,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff545454), width: 2)),
                                elevation: 0.5,
                                child: Text("₹",
                                    style: TextStyle(
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff545454),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        print(val);
                        PrefUtils().setFundTranAmount(val.toString());
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [],
                      //maxLength: 10,
                    ) /*CustomTextFormField(
                        validator: (value) {
                         print(value);
                        },
                        controller: amountController,
                        hintText: "lbl_enter_amount2".tr,
                        hintStyle: CustomTextStyles.titleSmallGray700,
                        textInputAction: TextInputAction.done,
                        prefix: Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.h, 24.v, 0.h, 0.5.v),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              // CustomImageView(
                              //     imagePath: ImageConstant.imageNotFound,
                              //     height: 16.5.adaptSize,
                              //     width: 16.5.adaptSize,
                              //     margin: EdgeInsets.fromLTRB(
                              //         15.h, 23.5.v, 10.580002.h, 23.5.v)),
                              CustomImageView(
                                  imagePath: ImageConstant.imageNotFound,
                                  height: 8.25.v,
                                  width: 5.5.h)
                            ])),
                        prefixConstraints: BoxConstraints(maxHeight: 64.v),
                        contentPadding: EdgeInsets.only(
                            top: 22.v, right: 30.h, bottom: 22.v),


                    )*/
                        ;
                  }),
              SizedBox(height: 34.v),
              CustomElevatedButton(
                  text: "lbl_send".tr,
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientIndigoAToPrimaryDecoration,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      navSendMoneyToPinCheck(context);
                    }
                  })
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the dmtPinScreen when the action is triggered.
  navSendMoneyToPinCheck(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dmtPinScreen,
    );
  }
}
