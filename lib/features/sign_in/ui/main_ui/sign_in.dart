import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/sign_in/ui/widgets/sign_in_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/text_styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(64),
              Text(
                AppStrings.signIn,
                style: TextStyles.bold24BlueBerry,
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              SvgPicture.asset(AppAssets.signUp),
              const Gap(24),
              const SignInForms(),
              const Gap(10),
              Text(AppStrings.forgetPassword,
                  style: TextStyles.regular13orange, textAlign: TextAlign.end),
              // ButtonWidget(onPressed: () {}, text: AppStrings.signUp),
              // const Gap(16),
              // const AlreadyHave(),
            ],
          ),
        ),
      ),
    );
  }
}
