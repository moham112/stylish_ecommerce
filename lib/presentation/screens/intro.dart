import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/intro.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 55.w),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "You Want\nAuthentic, here\nyou go!",
              style: TextStyle(
                height: 1.2,
                fontSize: 34.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
              "Find it here, buy it now!",
            ),
            SizedBox(height: 35.h),
            PrimaryButton(
              text: "Get Started",
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/mainScreen");
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    ));
  }
}
