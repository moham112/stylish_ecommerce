// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/presentation/widgets/primary_text_form_field.dart';
import 'package:ecommerce/presentation/widgets/social_media_element.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  TextEditingController imageUrlCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedWaitingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AuthenticatedFailureState) {
          return Center(child: Text("Error"));
        } else {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create an\naccount!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  PrimaryTextFormField(
                    controller: nameCtrl,
                    hintText: "Name",
                    prefix: Image.asset(
                      "assets/images/user.png",
                    ),
                  ),
                  SizedBox(height: 15.h),
                  PrimaryTextFormField(
                    controller: emailCtrl,
                    hintText: "Email",
                    prefix: Image.asset(
                      "assets/images/user.png",
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
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
                    height: 15.h,
                  ),
                  PrimaryTextFormField(
                    controller: confirmPasswordCtrl,
                    hintText: "Confirm Password",
                    prefix: Image.asset("assets/images/lock.png",
                        height: 20.h, width: 20.w),
                    suffix: Image.asset("assets/images/eye.png",
                        height: 20.h, width: 20.w),
                    obscureText: true,
                  ),
                  SizedBox(height: 15.h),
                  PrimaryTextFormField(
                    controller: imageUrlCtrl,
                    hintText: "Image URL Address",
                    prefix: Icon(Icons.image, size: 26),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "By clicking the Register button, you agree\nto the public offer",
                        style: TextStyle(
                          color: const Color(Colours.primary),
                          fontSize: 12.sp,
                        )),
                  ),
                  SizedBox(height: 15.h),
                  PrimaryButton(
                    text: "Create Account",
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).register({
                        "name": nameCtrl.text,
                        "email": emailCtrl.text,
                        "password": passwordCtrl.text,
                        "avatar": imageUrlCtrl.text,
                      });
                    },
                  ),
                  SizedBox(height: 15.h),
                  const Align(
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
                      const SocialMediaElement(
                          image: "assets/images/google.png"),
                      SizedBox(width: 10.w),
                      const SocialMediaElement(
                          image: "assets/images/apple.png"),
                      SizedBox(width: 10.w),
                      const SocialMediaElement(
                          image: "assets/images/facebook.png"),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/login"),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "I Already Have an Acccount ",
                            style: TextStyle(
                              color: const Color(Colours.grey5),
                              fontSize: 15.sp,
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color(Colours.primary),
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
      },
    );
  }
}
