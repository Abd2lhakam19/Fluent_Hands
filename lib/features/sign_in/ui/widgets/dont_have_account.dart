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
          text: AppStrings.dontHaveAccount,
          style: TextStyles.regular16BlueBerry,
        ),
        TextSpan(
          text: AppStrings.signUp,
          style: TextStyles.regular16orange,
        )
      ]),
    );
  }
}
