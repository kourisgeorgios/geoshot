import 'package:cloud_firestore/cloud_firestore.dart';

import 'notifier/login_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/core/utils/validation_functions.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends ConsumerState<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                        margin: EdgeInsets.only(left: 5.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.h, vertical: 68.v),
                        decoration: AppDecoration.fillGreen,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildLoginForm(context),
                              SizedBox(height: 27.v),
                              _buildPasswordForm(context),
                              SizedBox(height: 79.v),
                              CustomElevatedButton(
                                  height: 31.v,
                                  width: 104.h,
                                  text: "lbl_login".tr,
                                  margin: EdgeInsets.only(left: 80.h),
                                  buttonStyle:
                                      CustomButtonStyles.fillSecondaryContainer,
                                  buttonTextStyle: theme.textTheme.bodySmall!,
                                  onPressed: () {
                                    onTapLogin(context);
                                  }),
                              Spacer(),
                              Padding(
                                  padding: EdgeInsets.only(left: 80.h),
                                  child: Text("lbl_no_account_yet".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 16.v),
                              CustomElevatedButton(
                                  height: 31.v,
                                  width: 104.h,
                                  text: "lbl_register".tr,
                                  margin: EdgeInsets.only(left: 80.h),
                                  buttonStyle:
                                      CustomButtonStyles.fillSecondaryContainer,
                                  buttonTextStyle: theme.textTheme.bodySmall!,
                                  onPressed: () {
                                    onTapRegister(context);
                                  })
                            ]))))));
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Text("lbl_username".tr,
              style: TextStyle(
                  color: theme.colorScheme.primaryContainer,
                  fontSize: 14.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500))),
      SizedBox(height: 13.v),
      Consumer(builder: (context, ref, _) {
        return CustomTextFormField(
            controller: ref.watch(loginNotifier).userNameController,
            hintText: "lbl_insert_username".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            });
      })
    ]);
  }

  /// Section Widget
  Widget _buildPasswordForm(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child: Text("lbl_password".tr, style: theme.textTheme.titleSmall)),
      SizedBox(height: 11.v),
      Consumer(builder: (context, ref, _) {
        return CustomTextFormField(
            controller: ref.watch(loginNotifier).passwordController,
            hintText: "msg_insert_your_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true);
      })
    ]);
  }

  /// Navigates to the mainContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) async {
    NavigatorService.pushNamed(AppRoutes.mainContainerScreen);
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapRegister(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerScreen,
    );
  }
}
