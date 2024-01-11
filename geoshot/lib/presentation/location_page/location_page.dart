import 'notifier/location_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LocationPage extends ConsumerStatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  LocationPageState createState() => LocationPageState();
}

class LocationPageState extends ConsumerState<LocationPage> {

  Color boxColor = theme.colorScheme.onPrimaryContainer;
  Color boxColor2 = theme.colorScheme.onPrimaryContainer;
  bool isPressed = false;
  bool isPressed2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: 600.h,
                decoration: AppDecoration.fillGreen,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                            controller: ref
                                .watch(locationNotifier)
                                .photosInAreaController,
                            hintText: "msg_photos_in_the_area".tr,
                            hintStyle: CustomTextStyles.titleSmallBlack900,
                            readOnly : true,
                            borderDecoration:
                            TextFormFieldStyleHelper.fillOnErrorContainer,
                            fillColor: theme.colorScheme.onErrorContainer);
                      }),
                      SizedBox(height: 34.v),
                      Consumer(builder: (context, ref, _) {
                        return Padding(
                          padding: EdgeInsets.only(left: 29.h), // Adjust the padding values as needed
                          child: CustomTextFormField(
                            width: 250.h,
                            readOnly: true,
                            controller: ref.watch(locationNotifier).locationController,
                            hintText: "msg_thimy_took_this".tr,
                            textInputAction: TextInputAction.done,
                          ),
                        );
                      }),
                      SizedBox(height: 20.v),
                      Padding(
                          padding: EdgeInsets.only(left: 29.h, right: 54.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                          ImageConstant.imgMixcollage03J,
                                          height: 200.v,
                                          width: 180.h,
                                          margin: EdgeInsets.only(left: 59.h)),
                                      SizedBox(height: 37.v),
                                      Consumer(builder: (context, ref, _) {
                                        return CustomTextFormField(
                                            width: 250.h,
                                            readOnly : true,
                                            controller: ref
                                                .watch(locationNotifier)
                                                .locationController,
                                            hintText:
                                            "msg_giorgos_took_this".tr,
                                            textInputAction:
                                            TextInputAction.done);
                                      }),
                                      SizedBox(height: 14.v),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgMixcollage03J200x200,
                                          height: 200.adaptSize,
                                          width: 200.adaptSize,
                                          margin: EdgeInsets.only(left: 59.h))
                                    ]),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 17.v, bottom: 39.v),
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  // Toggle the color on tap
                                                  if (isPressed) {
                                                    boxColor2 =  appTheme.lightpruple400; // Change to a different color
                                                  } else {
                                                    boxColor2 =  theme.colorScheme.onPrimaryContainer; // Revert to the original color
                                                  }
                                                  isPressed = !isPressed; // Toggle the state
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 48,
                                                decoration: BoxDecoration(
                                                  color: boxColor2, // Change the fill color here
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    CustomImageView(
                                                      // Include your icon properties here
                                                      imagePath: ImageConstant.imgIconsStarBorder,
                                                      height: 22,
                                                      width: 24,
                                                      alignment: Alignment.topCenter,
                                                      margin: EdgeInsets.only(top: 7),
                                                    ),
                                                    // Other child widgets
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),



                                          SizedBox(height: 62.v),
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
                                                            .imgLockBlack900,
                                                        height: 23.v,
                                                        width: 24.h,
                                                        alignment:
                                                        Alignment.center,
                                                      onTap: () {
                                                      onTapImgLock1(
                                                          context);
                                                    })
                                                  ])),
                                          SizedBox(height: 156.v),
                                          Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  // Toggle the color on tap
                                                  if (isPressed2) {
                                                    boxColor =  appTheme.lightpruple400; // Change to a different color
                                                  } else {
                                                    boxColor =  theme.colorScheme.onPrimaryContainer; // Revert to the original color
                                                  }
                                                  isPressed2 = !isPressed2; // Toggle the state
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 48,
                                                decoration: BoxDecoration(
                                                  color: boxColor, // Change the fill color here
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    CustomImageView(
                                                      // Include your icon properties here
                                                      imagePath: ImageConstant.imgIconsStarBorder,
                                                      height: 22,
                                                      width: 24,
                                                      alignment: Alignment.topCenter,
                                                      margin: EdgeInsets.only(top: 7),
                                                    ),
                                                    // Other child widgets
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 64.v),
                                          Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                  height: 40.v,
                                                  width: 48.h,
                                                  child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadiusStyle
                                                                        .circleBorder20),
                                                                child: Container(
                                                                    height:
                                                                    40.v,
                                                                    width: 48.h,
                                                                    decoration: BoxDecoration(
                                                                        color: theme
                                                                            .colorScheme
                                                                            .onPrimaryContainer,
                                                                        borderRadius:
                                                                        BorderRadius.circular(20.h))))),
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgLockBlack900,
                                                            height: 22.v,
                                                            width: 24.h,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            margin:
                                                            EdgeInsets.only(
                                                                bottom:
                                                                6.v),
                                                            onTap: () {
                                                              onTapImgLock2(
                                                                  context);
                                                            })
                                                      ])))
                                        ]))
                              ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the giorgosScreen when the action is triggered.
  onTapImgLock2(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.giorgosScreen,
    );
  }
}
onTapImgLock1(BuildContext context) {
  NavigatorService.pushNamed(
    AppRoutes.thimyScreen,
  );
}
