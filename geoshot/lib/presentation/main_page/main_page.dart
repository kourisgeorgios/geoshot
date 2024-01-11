import 'notifier/main_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key})
      : super(
          key: key,
        );

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.green10001,
        body: Container(
          width: 600.h,
          decoration: AppDecoration.fillGreen10001,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 88.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 51.v,
                  width: 125.h,
                  decoration: AppDecoration.outlineErrorContainer.copyWith(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Center(
                    child: Text(
                      "lbl_geoshot".tr,
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        color: Colors.black, // Set the text color
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 11.v,
                  ),
                  decoration: AppDecoration.outlineErrorContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Text(
                      "msg_where_your_photos".tr,
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        color: Colors.black, // Set the text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 57.v),
                CustomImageView(
                  imagePath: ImageConstant.imgLogo1,
                  height: 217.v,
                  width: 241.h,
                  radius: BorderRadius.circular(
                    76.h,
                  ),
                ),
                SizedBox(height: 22.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
