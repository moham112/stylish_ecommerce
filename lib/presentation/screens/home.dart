import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:ecommerce/presentation/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedUnauthenticatedState) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white12,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                children: [
                  const HomeAppBar(),
                  SizedBox(height: 10.h),
                  SearchBar(),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "All Featured",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      Spacer(),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        elevation: 3,
                        child: DropdownButton<String>(
                          items: <String>[
                            'ASC',
                            'DSC',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle change here
                          },
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Image.asset(
                                  "assets/images/double_arrow.png")),
                          hint: Text('Sort'),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          isDense: true,
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        elevation: 2,
                        child: DropdownButton<String>(
                          items: <String>[
                            'ASC',
                            'DSC',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle change here
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Image.asset("assets/images/filter.png"),
                          ),
                          hint: Text('Filter'),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          isDense: true,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                          radius: 30.r,
                          backgroundImage:
                              Image.asset("assets/images/1.png").image,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10.w);
                      },
                      itemCount: 14,
                      shrinkWrap: true,
                    ),
                  ),
                  FlutterCarousel(
                    options: FlutterCarouselOptions(
                      showIndicator: true,
                      slideIndicator: CircularSlideIndicator(),
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              ));
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
