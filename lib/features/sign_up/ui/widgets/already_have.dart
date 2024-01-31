import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
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
          text: AppStrings.signIn,
          style: TextStyles.regular16orange,
        )
      ]),
    );
  }
}
