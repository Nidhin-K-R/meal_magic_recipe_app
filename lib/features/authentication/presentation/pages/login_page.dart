import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/core/network/auth/auth_service.dart';
import 'package:meal_magic_app/features/authentication/presentation/pages/signup_page.dart';
import 'package:meal_magic_app/features/authentication/presentation/widgets/custom_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void logIn() async {
    try {} on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 70.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
              Text("Welcome Back!", style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 60.h),
              CustomWidgets.inputText("Email"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Enter Email", emailController),
              SizedBox(height: 15.h),
              CustomWidgets.inputText("Password"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Enter Password", passwordController),
              SizedBox(height: 10.h),
              CustomWidgets.textButton("Forgot Password ?", () {}, 15),
              SizedBox(height: 10.h),
              CustomWidgets.button("Log in", () {
                setState(() {
                  logIn();
                  emailController.clear();
                  passwordController.clear();
                });
              }),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 10.w,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      endIndent: 10.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidgets.googleButton(() {}),
                  CustomWidgets.facebookButton(() {}),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomWidgets.textButton("Sign In", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => SignupPage()),
                    );
                  }, 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
