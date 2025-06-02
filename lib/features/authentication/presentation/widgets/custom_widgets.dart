import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/core/constants/colors.dart';

class CustomWidgets {
  static FocusNode name = FocusNode();
  static FocusNode email = FocusNode();
  static FocusNode password = FocusNode();
  static FocusNode cPassword = FocusNode();
  static FocusNode email2 = FocusNode();

  static textField({
    required String label,
    required var controller,
    required var focusNode,
    required BuildContext context,
    required var nextFocus,
  }) {
    return TextField(
      focusNode: focusNode,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      controller: controller,
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

  static inputText({required String label}) {
    return Text(
      label,
      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
    );
  }

  static button({required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
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

  static googleButton({required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Image.asset(
          "assets/images/auth_screen/google.jpeg",
          fit: BoxFit.fill,
          height: 50.r,
          width: 50.r,
        ),
      ),
    );
  }

  static facebookButton({required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Image.asset(
          "assets/images/auth_screen/facebook.jpeg",
          fit: BoxFit.fill,
          height: 50.r,
          width: 50.r,
        ),
      ),
    );
  }

  static textButton({
    required String label,
    required VoidCallback onPressed,
    required int size,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.orange,
          fontSize: size.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
