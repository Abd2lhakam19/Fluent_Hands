import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/features/sign_in/ui/main_ui/sign_in.dart';
import 'package:fluent_hands/features/sign_up/ui/main_ui/sign_up.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(96),
            SvgPicture.asset(AppAssets.onBoarding3),
            const Gap(64),
            ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                text: AppStrings.signUp),
            const Gap(16),
            ButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
              },
              text: AppStrings.signIn,
              backGroundColor: Colors.transparent,
              borderColor: AppColors.blueColor,
            ),
            const Gap(16),
            ButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                );
              },
              text: AppStrings.continueAsAGuest,
              borderColor: AppColors.blueColor,
              backGroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
