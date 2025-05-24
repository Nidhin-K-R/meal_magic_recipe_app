import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight),
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/splash_screen/splash_screen_image.jpeg",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 200.h),
            Text(
              "Get Cooking",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 5.sp,
                height: 0.8.h,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Simple way to find Tasty Recipe",
              style: TextStyle(fontSize: 18.sp, color: Colors.white38),
            ),
            SizedBox(height: 30.h),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => BottomNavBar()),
                );
              },
              icon: Icon(
                Icons.arrow_forward_rounded,
                size: 70.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
