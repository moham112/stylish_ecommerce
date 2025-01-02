import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Forgot\nPassword?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            PrimaryTextFormField(
              hintText: "Enter your email address",
              prefix: Image.asset(
                "assets/images/email.png",
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "* We will send you a message to set or reset\nyour new password",
                  style: TextStyle(
                    color: const Color(Colours.grey2),
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(height: 40.h),
            PrimaryButton(
              text: "Submit",
              onPressed: () {
                Navigator.pushNamed(context, '/intro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
