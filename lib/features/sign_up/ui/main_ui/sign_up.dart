import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/already_have.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/forms.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                AppStrings.signUp,
                style: TextStyles.bold24BlueBerry,
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              SvgPicture.asset(AppAssets.signUp),
              const Gap(24),
              const TextForms(),
              const Gap(24),
              ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AppLayout(),
                      ),
                    );
                  },
                  text: AppStrings.signUp),
              const Gap(16),
              const AlreadyHave(),
            ],
          ),
        ),
      ),
    );
  }
}
