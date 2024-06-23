import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/widgets/text_field.dart';

class TextForms extends StatefulWidget {
  const TextForms({super.key});

  @override
  State<TextForms> createState() => _TextFormsState();
}

class _TextFormsState extends State<TextForms> {
  bool isOpscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return Form(
          key: context.read<SignUpCubit>().singUpFormKey,
          child: Column(
            children: [
              TextFieldWidget(
                  hintText: AppStrings.name.tr(),
                  controller: context.read<SignUpCubit>().nameController,
                  validator: (vlaue) {
                    if (vlaue == null || vlaue.isEmpty) {
                      return "Invalid Name".tr();
                    }
                  }),
              const Gap(24),
              TextFieldWidget(
                  hintText: AppStrings.email.tr(),
                  controller: context.read<SignUpCubit>().emailController,
                  validator: (vlaue) {
                    if (vlaue == null ||
                        vlaue.isEmpty ||
                        !AppRegex.isEmailValid(vlaue)) {
                      return "Invalid Email".tr();
                    }
                  }),
              const Gap(24),
              TextFieldWidget(
                  hintText: AppStrings.password.tr(),
                  isOpscure: isOpscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpscure = !isOpscure;
                      });
                    },
                    child: Icon(
                        isOpscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  controller: context.read<SignUpCubit>().passwordController,
                  validator: (vlaue) {
                    if (vlaue == null ||
                        vlaue.isEmpty ||
                        !AppRegex.isPasswordValid(vlaue)) {
                      return "Invalid Password".tr();
                    }
                  }),
              const Gap(24),
              TextFieldWidget(
                  hintText: AppStrings.confirmPassword.tr(),
                  isOpscure: isOpscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpscure = !isOpscure;
                      });
                    },
                    child: Icon(
                        isOpscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  controller:
                      context.read<SignUpCubit>().confirmPasswordController,
                  validator: (vlaue) {
                    if (vlaue == null ||
                        vlaue.isEmpty ||
                        !AppRegex.isPasswordValid(vlaue)) {
                      return "Invalid Password".tr();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
