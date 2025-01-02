// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_form_field.dart';
import 'package:ecommerce/presentation/widgets/social_media_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SiginInState();
}

class _SiginInState extends State<SignIn> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome\nBack!",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            PrimaryTextFormField(
              controller: emailCtrl,
              hintText: "Email",
              prefix: Image.asset(
                "assets/images/user.png",
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            PrimaryTextFormField(
              controller: passwordCtrl,
              hintText: "Password",
              prefix: Image.asset("assets/images/lock.png",
                  height: 20.h, width: 20.w),
              suffix: Image.asset("assets/images/eye.png",
                  height: 20.h, width: 20.w),
              obscureText: true,
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/forgetPassword"),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?",
                    style: TextStyle(
                      color: const Color(Colours.primary),
                      fontSize: 12.sp,
                    )),
              ),
            ),
            SizedBox(height: 55.h),
            PrimaryButton(
              text: "Login",
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).login({
                  'email': emailCtrl.text,
                  'password': passwordCtrl.text,
                });
              },
            ),
            SizedBox(height: 70.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "- OR Continue with -",
                style: TextStyle(
                  color: Color(Colours.grey5),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaElement(image: "assets/images/google.png"),
                SizedBox(width: 10.w),
                SocialMediaElement(image: "assets/images/apple.png"),
                SizedBox(width: 10.w),
                SocialMediaElement(image: "assets/images/facebook.png"),
              ],
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/signUp"),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Create An Account ",
                      style: TextStyle(
                        color: Color(Colours.grey5),
                        fontSize: 15.sp,
                      ),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(Colours.primary),
                        decoration: TextDecoration.underline,
                        fontSize: 15.sp,
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
