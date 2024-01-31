import 'dart:async';

import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/main_ui/on_boarding1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const OnBoarding1(),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppAssets.svgLogo),
      ),
    );
  }
}
