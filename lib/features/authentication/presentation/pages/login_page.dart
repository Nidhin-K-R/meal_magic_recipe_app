import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meal_magic_app/features/app_main_screen/pages/app_main_screen.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void logIn() async {
    try {} on FirebaseAuthException catch (e) {
      setState(() {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${e.message}")));
      });
      print(e.message);
    }
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 70.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Welcome Back!", style: TextStyle(fontSize: 20.sp)),
                SizedBox(height: 60.h),
                CustomWidgets.inputText(label: "Email"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: "Enter Email",
                  controller: emailController,
                  focusNode: CustomWidgets.lemail,
                  context: context,
                  nextFocus: CustomWidgets.lpassword,
                  validatorString: "please enter email",
                ),
                SizedBox(height: 15.h),
                CustomWidgets.inputText(label: "Password"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: "Enter Password",
                  controller: passwordController,
                  focusNode: CustomWidgets.lpassword,
                  context: context,
                  nextFocus: CustomWidgets.lButton,
                  validatorString: "please enter password",
                ),
                SizedBox(height: 10.h),
                CustomWidgets.textButton(
                  label: "Forgot Password ?",
                  onPressed: () {},
                  size: 15,
                ),
                SizedBox(height: 10.h),
                CustomWidgets.button(
                  label: "Log in",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      logIn();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppMainScreen(),
                        ),
                      );
                    }
                  },
                  focusNode: CustomWidgets.lemail,
                ),
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
                    CustomWidgets.googleButton(onPressed: () {}),
                    CustomWidgets.facebookButton(onPressed: () {}),
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
                    CustomWidgets.textButton(
                      label: "Sign In",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => SignupPage()),
                        );
                      },
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
