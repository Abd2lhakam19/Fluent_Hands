import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/splash_screen/ui/splash_screen.dart';

//import 'features/learn/cubit/learn_cubit.dart';

class FluentHands extends StatelessWidget {
  const FluentHands({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio())))),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          // onGenerateRoute: appRouter.generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent, elevation: 0),
          ),
        ),
      ),
    );
  }
}
