import 'package:flutter/material.dart';
import 'package:meal_magic_app/core/constants/appConstants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_magic_app/features/app_main_screen/widgets/custom_widgets.dart';
import 'package:meal_magic_app/features/home/presentation/pages/home_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      HomeScreen(),
      navBarPage(Iconsax.save_2),
      navBarPage(Iconsax.additem),
      navBarPage(Iconsax.setting),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 35,
        selectedItemColor: appThemeColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          CustomWidgets.bottomNavItems(iconName: Iconsax.home, label: "Home"),
          CustomWidgets.bottomNavItems(
            iconName: Iconsax.save_2,
            label: "BookMark",
          ),
          CustomWidgets.bottomNavItems(
            iconName: Iconsax.additem,
            label: "Add Yours",
          ),
          CustomWidgets.bottomNavItems(
            iconName: Iconsax.setting,
            label: "Settings",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(child: Icon(iconName));
  }
}
