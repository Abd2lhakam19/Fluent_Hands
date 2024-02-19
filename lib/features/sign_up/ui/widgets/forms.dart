import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/text_field.dart';

class TextForms extends StatefulWidget {
  TextForms({super.key});

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
                hintText: AppStrings.name,
                controller: context.read<SignUpCubit>().signUpName,
              ),
              const Gap(24),
              TextFieldWidget(
                  hintText: AppStrings.email,
                  controller: context.read<SignUpCubit>().signUpEmail),
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
                    child: Icon(
                        isOpscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  controller: context.read<SignUpCubit>().signUpPassword),
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
                    child: Icon(
                        isOpscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  controller:
                      context.read<SignUpCubit>().signUpConfirmPassword),
            ],
          ),
        );
      },
    );
  }
}
