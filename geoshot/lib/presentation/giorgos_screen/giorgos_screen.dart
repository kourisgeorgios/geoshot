import 'notifier/giorgos_notifier.dart';
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

class GiorgosScreen extends ConsumerStatefulWidget {
  const GiorgosScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GiorgosScreenState createState() => GiorgosScreenState();
}

class GiorgosScreenState extends ConsumerState<GiorgosScreen> {
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
                            Consumer(
                              builder: (context, ref, _) {
                                return CustomTextFormField(
                                  readOnly : true,
                                  controller: ref
                                      .watch(giorgosNotifier)
                                      .usernameController,
                                  hintText: "lbl_giorgoskouris".tr,
                                  hintStyle: CustomTextStyles.bodyMediumGray300,
                                );
                              },
                            ),
                            SizedBox(height: 25.v),
                            Consumer(
                              builder: (context, ref, _) {
                                return CustomTextFormField(
                                  readOnly : true,
                                  controller:
                                      ref.watch(giorgosNotifier).bioController,
                                  hintText: "lbl_taking_photos".tr,
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
                  "lbl_giorgo_s_albums".tr,
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
              SizedBox(height: 15.v),
              CustomImageView(
                imagePath: ImageConstant.imgMixcollage03J200x200,
                height: 150.adaptSize,
                width: 150.adaptSize,
                margin: EdgeInsets.only(left: 30.h),
              ),
              SizedBox(height: 25.v),
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