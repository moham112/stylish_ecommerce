import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/core/constants/structures.dart';
import 'package:ecommerce/presentation/widgets/on_boarding_element.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  int onBoardingIndex = 1;
  final PageController pageController = PageController(
    initialPage: 0,
  );
  bool prevVisible = false;
  bool isGetStartedVisible = false;

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Center(
                child: RichText(
                    text: TextSpan(children: [
              TextSpan(
                text: widget.onBoardingIndex.toString(),
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "/3",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: InkWell(
                onTap: () => navigateToSignIn(),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    widget.onBoardingIndex = value + 1;
                    if (value != 0) {
                      widget.prevVisible = true;
                    } else {
                      widget.prevVisible = false;
                    }
                    if (value == 2) {
                      widget.isGetStartedVisible = true;
                    } else {
                      widget.isGetStartedVisible = false;
                    }
                  });
                },
                controller: widget.pageController,
                children: Structures.onBoarding
                    .map((e) => OnBoardingElement(
                          image: e["image"]!,
                          title: e["title"]!,
                          description: e["description"]!,
                        ))
                    .toList(),
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: widget.prevVisible,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: InkWell(
                      onTap: () {
                        widget.pageController.previousPage(
                            duration: const Duration(microseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        "Prev",
                        style: TextStyle(
                          color: const Color(Colours.grey),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.5.sp,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      OnBoardingDot(
                        index: 1,
                        currentIndex: widget.onBoardingIndex,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      OnBoardingDot(
                        index: 2,
                        currentIndex: widget.onBoardingIndex,
                      ),
                      SizedBox(width: 10.w),
                      OnBoardingDot(
                        index: 3,
                        currentIndex: widget.onBoardingIndex,
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (widget.pageController.page!.toInt() == 2) {
                        navigateToSignIn();
                        return;
                      }
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      widget.isGetStartedVisible ? "Get Started" : "Next",
                      style: TextStyle(
                        color: const Color(Colours.primary),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.pushReplacementNamed(context, "/login");
  }
}

class OnBoardingDot extends StatelessWidget {
  OnBoardingDot({
    super.key,
    required this.index,
    this.currentIndex,
  });

  final int index;
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 5000),
      curve: Curves.bounceOut,
      padding: currentIndex != index
          ? EdgeInsets.all(5.r)
          : EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: currentIndex != index
            ? const Color(0xff17223B).withOpacity(0.2)
            : Colors.black,
        borderRadius: currentIndex != index ? null : BorderRadius.circular(10),
        shape: currentIndex != index ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}
