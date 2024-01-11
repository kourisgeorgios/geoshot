import 'notifier/register_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/core/utils/validation_functions.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_icon_button.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

// ignore_for_file: must_be_immutable
class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Function to handle user registration
  Future<void> registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Registration successful, save user data to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text.trim(),
          'username': _usernameController.text.trim(),
          // You can add more fields here if needed
        });

        NavigatorService.pushNamed(AppRoutes.mainContainerScreen);
      } catch (e) {
        print('Registration failed: $e');
        // Handle registration errors
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      onTapRegister_back(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildEmailField(context),
                      SizedBox(height: 20.0),
                      _buildUsernameField(context),
                      SizedBox(height: 20.0),
                      _buildPasswordField(context),
                      SizedBox(height: 20.0),
                      _buildConfirmPasswordField(context),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  height: 31,
                  width: 104,
                  text: "lbl_register".tr,
                  buttonStyle: CustomButtonStyles.fillSecondaryContainer,
                  buttonTextStyle: theme.textTheme.bodySmall!,
                  onPressed: () {
                    registerUser(context); // Call function to register user
                    onTapRegister(context);
                  },
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// OLD NOT USED HERE
  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 65.h),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Text("lbl_email".tr, style: theme.textTheme.titleSmall),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.only(right: 65.h),
                child: Consumer(builder: (context, ref, _) {
                  return CustomTextFormField(
                    controller: ref.watch(registerNotifier).emailController,
                    hintText: "lbl_insert_email".tr,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_email".tr;
                      }
                      return null;
                    },
                  );
                }),
              ),
            ],
          ),
          Positioned(
            top: 5.v,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back, size: 35, // Increased icon size
                color: Colors.black, // Set icon color
              ),
              onPressed: () {
                // Navigate to the login screen on button press
                NavigatorService.pushNamed(AppRoutes.loginScreen);
              },
            ),
          ),
          Positioned(
            top: 50.v,
            right: 0,
            child: SizedBox(
              height: 40.v,
              width: 48.h,
              child: InkWell(
                onTap: () {
                  // Navigate to the login screen on image tap
                  onTapRegister(context);
                },
                child: CustomImageView(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your email",
          style: TextStyle(
              fontSize: 12.0, color: Colors.black), // Change color to black
        ),
        SizedBox(height: 5.0),
        CustomTextFormField(
          controller: _emailController,
          hintText: "lbl_insert_email".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty || !isValidEmail(value)) {
              return "Please enter a valid email address";
            }
            return null;
          },
          // Other properties for this text field...
        ),
      ],
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose a username",
          style: TextStyle(
              fontSize: 12.0, color: Colors.black), // Change color to black
        ),
        SizedBox(height: 5.0),
        CustomTextFormField(
          controller: _usernameController,
          hintText: "lbl_insert_username".tr,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a username";
            }
            return null;
          },
          // Other properties for this text field...
        ),
      ],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your password",
          style: TextStyle(
              fontSize: 12.0, color: Colors.black), // Change color to black
        ),
        SizedBox(height: 5.0),
        CustomTextFormField(
          controller: _passwordController,
          hintText: "lbl_insert_password".tr,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a password";
            }
            // Add any password validation logic if needed
            return null;
          },
          // Other properties for this text field...
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm your password",
          style: TextStyle(
              fontSize: 12.0, color: Colors.black), // Change color to black
        ),
        SizedBox(height: 5.0),
        CustomTextFormField(
          controller: _confirmPasswordController,
          hintText: "lbl_repeat_password".tr,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please confirm the password";
            }
            // Add logic to match password confirmation if needed
            if (value != _passwordController.text) {
              return "Passwords do not match";
            }
            return null;
          },
          // Other properties for this text field...
        ),
      ],
    );
  }

  onTapRegister(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainContainerScreen,
    );
  }

  onTapRegister_back(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
