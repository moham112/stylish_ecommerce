import 'package:ecommerce/core/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String hintText;
  final Widget prefix;
  Widget? suffix;
  bool obscureText; 
  TextEditingController? controller;

  PrimaryTextFormField({
    super.key,
    required this.hintText,
    required this.prefix,
    this.suffix,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
        fillColor: const Color(Colours.grey3),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(Colours.grey4)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(Colours.grey2),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
