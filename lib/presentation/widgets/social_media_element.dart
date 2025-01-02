import 'package:ecommerce/core/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaElement extends StatelessWidget {
  const SocialMediaElement({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(Colours.opacityPrimary),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(Colours.primary),
        ),
      ),
      child: Image.asset(image, height: 30.h, width: 30.w),
    );
  }
}
