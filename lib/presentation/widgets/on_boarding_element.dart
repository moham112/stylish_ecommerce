import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingElement extends StatelessWidget {
  const OnBoardingElement({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  //assets/images/onboarding_1.png
  //Choose Product
  /* "Amet minim mollit non deserunt ullamco est\n"
    "sit aliqua dolor do amet sint. Velit officia\n"
    "consequat duis enim velit mollit."
  */
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xffA8A8A9),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            description)
      ],
    );
  }
}
