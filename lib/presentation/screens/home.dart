import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(Colours.grey7),
          child: Column(
            children: [
              const HomeAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Image.asset("assets/images/search.png"),
                    suffixIcon: Image.asset("assets/images/mic.png"),
                    hintText: "Search any Product",
                    hintStyle: TextStyle(
                      color: const Color(Colours.grey7),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/more.png"),
          Image.asset("assets/images/splash_logo.png", height: 30.h),
          InkWell(
            onTap: () async {
              debugPrint("Tapped");
              await CacheHelper.delete("access_token").then((value) {
                print("debugger: $value");
              }).catchError((error) {
                print("debugger: $error");
              });
              if (context.mounted) {
                BlocProvider.of<AuthCubit>(context).signOut();
              }
            },
            child: Image.asset("assets/images/pink_avatar.png"),
          ),
        ],
      ),
    );
  }
}
