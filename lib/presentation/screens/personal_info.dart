// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/presentation/widgets/main_appbar.dart';
import 'package:ecommerce/presentation/widgets/personal_info_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MainAppBar(title: "Personal Information"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.r),
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage:
                            AssetImage("assets/images/pink_avatar_x.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 4.w,
                          ),
                          shape: BoxShape.circle,
                          color: Color(Colours.cyan),
                        ),
                        child: Image.asset("assets/images/pen.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              FormElement(title: "Email"),
              SizedBox(height: 20.h),
              FormElement(title: "Password"),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    color: Color(Colours.primary),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(Colours.primary),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Divider(
                color: Color(Colours.grey),
              ),
              const Title(text: "Pincode"),
              SizedBox(height: 10.h),
              PersonalInfoTextField(),
              SizedBox(height: 20.h),
              FormElement(title: "Password"),
              SizedBox(height: 20.h),
              FormElement(title: "Password"),
              SizedBox(height: 20.h),
              FormElement(title: "Password"),
              SizedBox(height: 20.h),
              FormElement(title: "Password"),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    ));
  }
}

class Title extends StatelessWidget {
  final String text;

  const Title({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
      ),
    );
  }
}

class FormElement extends StatelessWidget {
  const FormElement({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Title(text: title),
        SizedBox(height: 10.h),
        PersonalInfoTextField(),
      ],
    );
  }
}
