import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/core/network/auth/auth_service.dart';
import 'package:meal_magic_app/features/authentication/presentation/pages/login_page.dart';
import 'package:meal_magic_app/features/authentication/presentation/widgets/custom_widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    try {
      await authService.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an account",

                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Let's help you set up your account,\nit won't take long.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black26,
                ),
              ),
              SizedBox(height: 30.h),
              CustomWidgets.inputText("Name"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Enter Name", nameController),
              SizedBox(height: 15.h),
              CustomWidgets.inputText("Email"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Enter Email", emailController),
              SizedBox(height: 15.h),
              CustomWidgets.inputText("Password"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Enter Password", passwordController),
              SizedBox(height: 15.h),
              CustomWidgets.inputText("Confirm Password"),
              SizedBox(height: 5.h),
              CustomWidgets.textField("Confirm Password", cPasswordController),
              SizedBox(height: 25.h),
              CustomWidgets.button("Sign Up", () {
                signUp();
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                cPasswordController.clear();
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
              SizedBox(height: 5.h),
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
                  CustomWidgets.textButton("Log In", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => LoginPage()),
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
