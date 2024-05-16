import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/features/sign_up/ui/main_ui/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: AppStrings.doNotHaveAccount,
          style: TextStyles.regular16BlueBerry,
        ),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap =
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    )),
          text: AppStrings.signUp,
          style: TextStyles.regular16orange.copyWith(
            color: AppColors.blueColor,
          ),
        )
      ]),
    );
  }
}
