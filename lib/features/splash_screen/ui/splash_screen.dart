import 'dart:async';

import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/main_ui/on_boarding1.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding2/main_ui/on_boarding2.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/cashe/cashe_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool firstTime =
        CacheHelper.sharedPreferences.getBool('isFirstTime') ?? true;
    bool isLogIn = CacheHelper.sharedPreferences.getBool('isLogIn') ?? false;
    CacheHelper.sharedPreferences.setString('token', "");
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => firstTime
              ? const OnBoarding1()
              : isLogIn
                  ? const AppLayout()
                  : const OnBoarding2(),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.svgLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
