import 'package:flutter/material.dart';

class CustomWidgets {
  static bottomNavItems({required var iconName, required String label}) {
    return BottomNavigationBarItem(icon: Icon(iconName), label: label);
  }
}
