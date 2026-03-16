import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Please enter your data to continue",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              controller: TextEditingController(),
              hinText: "Enter Email",
              prefixIcon: const Icon(Icons.mail_outline),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: TextEditingController(),
              hinText: "Enter Password",
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget your password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.teal,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 60.h),
            AppPrimaryButton(text: "Login", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
