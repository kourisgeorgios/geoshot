import 'notifier/profile_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/widgets/custom_elevated_button.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 600.h,
                decoration: AppDecoration.fillGreen,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 23.h, vertical: 26.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 21.h, right: 76.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 16.v),
                                        child: Column(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant.imgLock,
                                              height: 83.adaptSize,
                                              width: 83.adaptSize),
                                          SizedBox(height: 23.v),
                                          SizedBox(
                                              height: 40.v,
                                              width: 48.h,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .circleBorder20),
                                                            child: Container(
                                                                height: 40.v,
                                                                width: 48.h,
                                                                decoration: BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .onPrimaryContainer,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.h))))),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgSearchBlueGray900,
                                                        height: 24.adaptSize,
                                                        width: 24.adaptSize,
                                                        alignment:
                                                            Alignment.center,
                                                        onTap: () {
                                                          onTapImgSearch(
                                                              context);
                                                        })
                                                  ]))
                                        ])),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 28.h, bottom: 44.v),
                                            child: Column(children: [
                                              _buildUserName(context),
                                              SizedBox(height: 23.v),
                                              _buildUserBio(context)
                                            ])))
                                  ])),
                          SizedBox(height: 51.v),
                          _buildMyAlbums(context),
                          Spacer(flex: 57),
                          _buildMyLatestPhotos(context),
                          Spacer(flex: 42)
                        ])))));
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            readOnly: true,
            controller: ref.watch(profileNotifier).userNameController,
            hintText: "lbl_konstantinos11".tr,
            hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
            fillColor: appTheme.gray300,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserBio(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          readOnly: true,
          controller: ref.watch(profileNotifier).userBioController,
          hintText: "msg_i_read_books_and".tr,
          hintStyle: CustomTextStyles.bodyMediumOnErrorContainer,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.outlineBlackTL4,
          fillColor: appTheme.gray300,
        );
      },
    );
  }


  /// Section Widget
  Widget _buildMyAlbums(BuildContext context) {
    return CustomElevatedButton(width: 134.h, text: "lbl_my_albums".tr);
  }

  /// Section Widget
  Widget _buildMyLatestPhotos(BuildContext context) {
    return CustomElevatedButton(width: 134.h, text: "msg_my_latest_photos".tr);
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImgSearch(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
