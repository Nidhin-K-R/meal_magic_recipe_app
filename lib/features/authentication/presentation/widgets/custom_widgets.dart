import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/core/constants/colors.dart';

class CustomWidgets {
  static textField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black26),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static inputText(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold),
    );
  }

  static button(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static googleButton(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Image.asset(
          "assets/images/auth_screen/google.jpeg",
          height: 50.h,
          width: 50.w,
        ),
      ),
    );
  }

  static facebookButton(VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Image.asset(
          "assets/images/auth_screen/facebook.jpeg",
          height: 50.h,
          width: 50.w,
        ),
      ),
    );
  }

  static textButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
