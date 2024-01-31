import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/text_field.dart';

class TextForms extends StatefulWidget {
  const TextForms({super.key});

  @override
  State<TextForms> createState() => _TextFormsState();
}

class _TextFormsState extends State<TextForms> {
  final formKey = GlobalKey<FormState>();
  bool isOpscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldWidget(hintText: AppStrings.name),
          const Gap(24),
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
          const Gap(24),
          TextFieldWidget(
            hintText: AppStrings.confirmPassword,
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
