import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_magic_app/core/constants/appConstants.dart';
import 'package:meal_magic_app/core/network/auth/auth_service.dart';
import 'package:meal_magic_app/features/authentication/presentation/pages/login_page.dart';
import 'package:meal_magic_app/features/authentication/presentation/widgets/custom_widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      setState(() {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${e.message}")));
      });
      print(e.message);
    }
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    cPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an account",

                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                CustomWidgets.inputText(label: "Name"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: "Enter Name",
                  controller: nameController,
                  focusNode: CustomWidgets.name,
                  context: context,
                  nextFocus: CustomWidgets.email,
                  validatorString: "please enter name",
                ),
                SizedBox(height: 15.h),
                CustomWidgets.inputText(label: "Email"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: "Enter Email",
                  controller: emailController,
                  focusNode: CustomWidgets.email,
                  context: context,
                  nextFocus: CustomWidgets.password,
                  validatorString: "please enter email",
                ),
                SizedBox(height: 15.h),
                CustomWidgets.inputText(label: "Password"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: "Enter Password",
                  controller: passwordController,
                  focusNode: CustomWidgets.password,
                  context: context,
                  nextFocus: CustomWidgets.cPassword,
                  validatorString: "please enter password",
                ),
                SizedBox(height: 15.h),
                CustomWidgets.inputText(label: "Confirm Password"),
                SizedBox(height: 5.h),
                CustomWidgets.textField(
                  label: 'Confirm Password',
                  controller: cPasswordController,
                  focusNode: CustomWidgets.cPassword,
                  context: context,
                  nextFocus: CustomWidgets.sButton,
                  validatorString: "please re enter passwod",
                ),
                SizedBox(height: 25.h),
                CustomWidgets.button(
                  label: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                  focusNode: CustomWidgets.sButton,
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
                    CustomWidgets.textButton(
                      label: "Log In",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => LoginPage()),
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
