import 'notifier/main_container_notifier.dart';
import 'package:geoshot/core/app_export.dart';
import 'package:geoshot/presentation/camera_page/camera_page.dart';
import 'package:geoshot/presentation/location_page/location_page.dart';
import 'package:geoshot/presentation/main_page/main_page.dart';
import 'package:geoshot/presentation/profile_page/profile_page.dart';
import 'package:geoshot/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainContainerScreen extends ConsumerStatefulWidget {
  const MainContainerScreen({Key? key}) : super(key: key);

  @override
  MainContainerScreenState createState() => MainContainerScreenState();
}

// ignore_for_file: must_be_immutable
class MainContainerScreenState extends ConsumerState<MainContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.green10001,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.mainPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Main:
        return AppRoutes.mainPage;
      case BottomBarEnum.Camera:
        return AppRoutes.cameraPage;
      case BottomBarEnum.Location:
        return AppRoutes.locationPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.mainPage:
        return MainPage();
      case AppRoutes.cameraPage:
        return CameraPage();
      case AppRoutes.locationPage:
        return LocationPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
