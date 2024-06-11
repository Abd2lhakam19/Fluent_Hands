import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/widgets/text_field.dart';

class SignInForms extends StatefulWidget {
  const SignInForms({super.key});

  @override
  State<SignInForms> createState() => _SignInFormsState();
}

class _SignInFormsState extends State<SignInForms> {
  bool isOpscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInStates>(
      builder: (context, state) {
        return Form(
          key: context.read<SignInCubit>().signInFormKey,
          child: Column(
            children: [
              TextFieldWidget(
                hintText: AppStrings.email,
                controller: context.read<SignInCubit>().emailController,
                validator: (vlaue) {
                  if (vlaue == null ||
                      vlaue.isEmpty ||
                      !AppRegex.isEmailValid(vlaue)) {
                    return "Invalid Email";
                  }
                },
              ),
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
                  child:
                      Icon(isOpscure ? Icons.visibility_off : Icons.visibility),
                ),
                controller: context.read<SignInCubit>().passwordController,
                validator: (vlaue) {
                  if (vlaue == null ||
                      vlaue.isEmpty ||
                      !AppRegex.isPasswordValid(vlaue)) {
                    return "Invalid Password";
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
