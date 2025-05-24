import 'package:flutter/material.dart';
import 'package:meal_magic_app/bottom_nav_bar.dart';
import 'package:meal_magic_app/features/splashscreen/splash_screen.dart';

class AppRouts {
  static String nav = "";
  static String splash = "";
  Map<String, WidgetBuilder> routs() {
    return {
      nav: (BuildContext context) => BottomNavBar(),
      splash: (BuildContext context) => SplashScreen(),
    };
  }
}
