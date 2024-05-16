import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/features/sign_in/ui/main_ui/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHave extends StatelessWidget {
  const AlreadyHave({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: AppStrings.alreadyHave,
          style: TextStyles.regular16BlueBerry,
        ),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap =
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    )),
          text: AppStrings.signIn,
          style: TextStyles.regular16orange.copyWith(
            color: AppColors.blueColor,
          ),
        )
      ]),
    );
  }
}
