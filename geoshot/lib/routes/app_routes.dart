import 'package:flutter/material.dart';
import 'package:geoshot/presentation/login_screen/login_screen.dart';
import 'package:geoshot/presentation/register_screen/register_screen.dart';
import 'package:geoshot/presentation/main_container_screen/main_container_screen.dart';
import 'package:geoshot/presentation/settings_screen/settings_screen.dart';
import 'package:geoshot/presentation/giorgos_screen/giorgos_screen.dart';
import 'package:geoshot/presentation/thimy_screen/thimy_screen.dart';
import 'package:geoshot/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String mainPage = '/main_page';

  static const String mainContainerScreen = '/main_container_screen';

  static const String cameraPage = '/camera_page';

  static const String profilePage = '/profile_page';

  static const String settingsScreen = '/settings_screen';

  static const String locationPage = '/location_page';

  static const String giorgosScreen = '/giorgos_screen';

  static const String thimyScreen = '/thimy_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    mainContainerScreen: (context) => MainContainerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    giorgosScreen: (context) => GiorgosScreen(),
    thimyScreen: (context) => ThimyScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginScreen(),
  };
}
