import 'notifier/settings_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/core/utils/validation_functions.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_outlined_button.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 600.h,
            child: Container(
              margin: EdgeInsets.only(left: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 41.h,
                vertical: 30.v,
              ),
              decoration: AppDecoration.fillGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 83.adaptSize,
                          width: 83.adaptSize,
                          margin: EdgeInsets.only(
                            top: 54.v,
                            bottom: 367.v,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 39.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildChangeUsernameButton(context),
                                    _buildBackButton(context),
                                  ],
                                ),
                                SizedBox(height: 16.v),
                                _buildSupportingTextEditText1(context),
                                SizedBox(height: 48.v),
                                _buildEditPersonalDescriptionButton(context),
                                SizedBox(height: 20.v),
                                _buildSupportingTextEditText2(context),
                                SizedBox(height: 61.v),
                                _buildEditPasswordButton(context),
                                SizedBox(height: 9.v),
                                _buildPasswordEditText(context),
                                SizedBox(height: 45.v),
                                _buildChangeEmailButton(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                  _buildEmailEditText(context),
                  SizedBox(height: 56.v),
                  _buildSaveChangesButton(context),
                  SizedBox(height: 81.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChangeUsernameButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 149.h,
      text: "lbl_change_username".tr,
      margin: EdgeInsets.only(top: 34.v),
    );
  }

  /// Section Widget
  Widget _buildBackButton(BuildContext context) {
    return CustomElevatedButton(
      width: 80.h,
      text: "lbl_back".tr,
      margin: EdgeInsets.only(bottom: 26.v),
      buttonStyle: CustomButtonStyles.fillSecondaryContainer,
      buttonTextStyle: CustomTextStyles.titleSmallBlack900,
      onPressed: () {
        onTapSave(context);
      },
    );
  }

  /// Section Widget
  Widget _buildSupportingTextEditText1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 47.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller:
                ref.watch(settingsNotifier).supportingTextEditText1Controller,
            hintText: "lbl_konstantinos11".tr,
            hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
            fillColor: appTheme.gray300,
            textStyle: TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEditPersonalDescriptionButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 193.h,
      text: "msg_edit_personal_description".tr,
      margin: EdgeInsets.only(left: 6.h),
    );
  }

  /// Section Widget
  Widget _buildSupportingTextEditText2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 47.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller:
                ref.watch(settingsNotifier).supportingTextEditText2Controller,
            hintText: "msg_i_read_books_and".tr,
            hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
            fillColor: appTheme.gray300,
            textStyle: TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEditPasswordButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 123.h,
      text: "lbl_edit_password".tr,
      margin: EdgeInsets.only(left: 11.h),
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 44.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(settingsNotifier).passwordEditTextController,
            hintText: "lbl".tr,
            hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
            fillColor: appTheme.gray300,
            textInputType: TextInputType.visiblePassword,
            textStyle: TextStyle(color: Colors.black),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,

          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildChangeEmailButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 120.h,
      text: "lbl_change_email".tr,
      margin: EdgeInsets.only(left: 5.h),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 44.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            width: 344.h,
            controller: ref.watch(settingsNotifier).emailEditTextController,
            hintText: "msg_konstantinos_apple_com".tr,
            hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
            fillColor: appTheme.gray300,
            textInputType: TextInputType.emailAddress,
            alignment: Alignment.centerRight,
            textStyle: TextStyle(color: Colors.black),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },

          );
        },
      ),
    );
  }


  /// Section Widget
  Widget _buildSaveChangesButton(BuildContext context) {
    return CustomElevatedButton(
      width: 138.h,
      text: "lbl_save_changes".tr,
      margin: EdgeInsets.only(left: 13.h),
      buttonStyle: CustomButtonStyles.fillSecondaryContainer,
      buttonTextStyle: CustomTextStyles.titleSmallBlack900,
      onPressed: () {
        onTapSave(context);
      },
    );
  }
  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainContainerScreen,
    );
  }
}
