import 'package:fluent_hands/core/routing/routes.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/main_ui/on_boarding1.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding2/main_ui/on_boarding2.dart';
import 'package:fluent_hands/features/splash_screen/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoarding1:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding1(),
        );
      case Routes.onBoarding2:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding2(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Not Found"),
              ),
            ),
          ),
        );
    }
  }
}
