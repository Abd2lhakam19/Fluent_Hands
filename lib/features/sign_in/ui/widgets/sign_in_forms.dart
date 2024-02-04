import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/text_field.dart';

class SignInForms extends StatefulWidget {
  const SignInForms({super.key});

  @override
  State<SignInForms> createState() => _SignInFormsState();
}

class _SignInFormsState extends State<SignInForms> {
  final formKey = GlobalKey<FormState>();
  bool isOpscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldWidget(hintText: AppStrings.email),
          const Gap(24),
          TextFieldWidget(
            hintText: AppStrings.password,
            isOpscure: isOpscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isOpscure = !isOpscure;
                });
              },
              child: Icon(isOpscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
}
