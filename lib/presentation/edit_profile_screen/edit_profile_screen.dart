import 'bloc/edit_profile_bloc.dart';
import 'models/edit_profile_model.dart';
import 'package:dollervilla/core/app_export.dart';
import 'package:dollervilla/core/utils/validation_functions.dart';
import 'package:dollervilla/widgets/custom_icon_button.dart';
import 'package:dollervilla/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(EditProfileState(
        editProfileModelObj: EditProfileModel(),
      ))
        ..add(EditProfileInitialEvent()),
      child: EditProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: 200.h,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Column(
                  children: [
                    _buildMegaphoneRow(context),
                    SizedBox(height: 59.v),
                    SizedBox(
                      height: 192.v,
                      width: 189.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse39192x189,
                            height: 192.v,
                            width: 189.h,
                            radius: BorderRadius.circular(
                              96.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.v),
                            child: CustomIconButton(
                              height: 48.adaptSize,
                              width: 48.adaptSize,
                              padding: EdgeInsets.all(15.h),
                              decoration: IconButtonStyleHelper
                                  .fillOnPrimaryContainerTL24,
                              alignment: Alignment.bottomCenter,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgEditBlue500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        right: 29.h,
                      ),
                      child: BlocSelector<EditProfileBloc, EditProfileState,
                          TextEditingController?>(
                        selector: (state) => state.nameController,
                        builder: (context, nameController) {
                          return CustomTextFormField(
                            controller: nameController,
                            hintText: "lbl_name".tr,
                            validator: (value) {
                              if (!isText(value)) {
                                return "err_msg_please_enter_valid_text".tr;
                              }
                              return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 22.v,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        right: 29.h,
                      ),
                      child: BlocSelector<EditProfileBloc, EditProfileState,
                          TextEditingController?>(
                        selector: (state) => state.emailController,
                        builder: (context, emailController) {
                          return CustomTextFormField(
                            controller: emailController,
                            hintText: "lbl_email_id2".tr,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_email".tr;
                              }
                              return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 22.v,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        right: 29.h,
                      ),
                      child: BlocSelector<EditProfileBloc, EditProfileState,
                          TextEditingController?>(
                        selector: (state) => state.phoneNumberController,
                        builder: (context, phoneNumberController) {
                          return CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "lbl_phone_number2".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (!isValidPhone(value)) {
                                return "err_msg_please_enter_valid_phone_number"
                                    .tr;
                              }
                              return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 22.v,
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 5.v,
                        width: 146.h,
                        margin: EdgeInsets.only(left: 48.h),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 146.h,
                                child: Divider(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withOpacity(1),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 146.h,
                                child: Divider(
                                  color: appTheme.blueGray40001,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMegaphoneRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMegaphone,
            height: 10.v,
            width: 18.h,
            margin: EdgeInsets.only(
              top: 5.v,
              bottom: 17.v,
            ),
          ),
          Spacer(),
          SizedBox(
            height: 33.v,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.v,
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPrinter,
            height: 27.v,
            width: 26.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 3.v,
              bottom: 3.v,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPhBell,
            height: 27.adaptSize,
            width: 27.adaptSize,
            margin: EdgeInsets.only(
              left: 27.h,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }
}
