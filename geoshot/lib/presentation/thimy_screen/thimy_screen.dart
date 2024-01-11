import 'notifier/thimy_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/presentation/camera_page/camera_page.dart';
import 'package:geoshot/presentation/location_page/location_page.dart';
import 'package:geoshot/presentation/main_page/main_page.dart';
import 'package:geoshot/presentation/profile_page/profile_page.dart';
import 'package:geoshot/widgets/custom_bottom_bar.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_icon_button.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ThimyScreen extends ConsumerStatefulWidget {
  const ThimyScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ThimyScreenState createState() => ThimyScreenState();
}

class ThimyScreenState extends ConsumerState<ThimyScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 600.h,
          padding: EdgeInsets.symmetric(
            horizontal: 29.h,
            vertical: 24.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  right: 70.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.v),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgLock,
                            height: 83.adaptSize,
                            width: 83.adaptSize,
                          ),
                          SizedBox(height: 19.v),
                          SizedBox(
                            height: 40.v,
                            width: 48.h,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                CustomIconButton(
                                    height: 40.v,
                                    width: 48.h,
                                    alignment: Alignment.center,
                                    child: CustomImageView(),
                                    onTap: () {
                                      onTapImgLock2(
                                          context);
                                    }
                                ),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowLeft,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    alignment: Alignment.topCenter,
                                    margin: EdgeInsets.only(top: 7.v),
                                    onTap: () {
                                      onTapImgLock2(
                                          context);
                                    }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 29.h,
                          bottom: 40.v,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 344.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 14.v,
                              ),
                              decoration:
                              AppDecoration.outlineBlack9001.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Text(
                                "lbl_thimy".tr,
                                style: CustomTextStyles.bodyMediumGray300,
                              ),
                            ),
                            SizedBox(height: 25.v),
                            Consumer(
                              builder: (context, ref, _) {
                                return CustomTextFormField(
                                  readOnly: true,
                                  controller: ref
                                      .watch(thimyNotifier)
                                      .messageController,
                                  hintText: "lbl_i_exist".tr,
                                  hintStyle: CustomTextStyles.bodyMediumGray300,
                                  textInputAction: TextInputAction.done,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 37.v),
              Container(
                width: 116.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder20,
                ),
                child: Text(
                  "lbl_thimy_s_albums".tr,
                  style: CustomTextStyles.titleSmallOnPrimaryContainer,
                ),
              ),
              Spacer(),
              Container(
                width: 116.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder20,
                ),
                child: Text(
                  "lbl_latest_photos".tr,
                  style: CustomTextStyles.titleSmallOnPrimaryContainer,
                ),
              ),
              SizedBox(height: 20.v),
              CustomImageView(
                imagePath: ImageConstant.imgMixcollage03J,
                height: 141.v,
                width: 155.h,
                margin: EdgeInsets.only(left: 10.h),
              ),
              SizedBox(height: 29.v),
            ],
          ),
        ),

      ),
    );
  }
}

onTapImgLock2(BuildContext context) {
  NavigatorService.pushNamed(
    AppRoutes.mainContainerScreen,
  );
}