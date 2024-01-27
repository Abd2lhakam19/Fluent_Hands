import 'package:fluent_hands/core/routing/app_router.dart';
import 'package:fluent_hands/core/routing/routes.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FluentHands extends StatelessWidget {
  const FluentHands({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.darkWhite,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        ),
      ),
    );
  }
}
