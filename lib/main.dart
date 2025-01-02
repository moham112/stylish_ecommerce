import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/core/constants/colours.dart';
import 'package:ecommerce/core/dio_helper.dart';
import 'package:ecommerce/core/injection.dart';
import 'package:ecommerce/data/services/auth_web_service.dart';
import 'package:ecommerce/logic/auth_cubit.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:ecommerce/presentation/screens/checkout.dart';
import 'package:ecommerce/presentation/screens/forget_password.dart';
import 'package:ecommerce/presentation/screens/intro.dart';
import 'package:ecommerce/presentation/screens/home.dart';
import 'package:ecommerce/presentation/screens/on_boarding.dart';
import 'package:ecommerce/presentation/screens/personal_info.dart';
import 'package:ecommerce/presentation/screens/sign_in.dart';
import 'package:ecommerce/presentation/screens/sign_up.dart';
import 'package:ecommerce/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  Injection.injectIt();

  runApp(BlocProvider(
      create: (context) => Injection.serviceLocator<AuthCubit>(),
      child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(Colours.primary),
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onBoarding': (context) => OnBoarding(),
          '/signIn': (context) => const SignIn(),
          '/signUp': (context) => const SingUp(),
          '/forgetPassword': (context) => const ForgetPassword(),
          '/intro': (context) => const Intro(),
          '/mainScreen': (context) => const Home(),
          '/personalInfo': (context) => const PersonalInfo(),
          '/checkout': (context) => const Checkout(),
        },
      ),
    );
  }
}
