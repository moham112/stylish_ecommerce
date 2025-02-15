import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedUnauthenticatedState) {
          Navigator.pushReplacementNamed(context, "/login");
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/more.png"),
            Image.asset("assets/images/splash_logo.png", height: 30.h),
            Image.asset("assets/images/pink_avatar.png"),
          ],
        ),
      ),
    );
  }
}
