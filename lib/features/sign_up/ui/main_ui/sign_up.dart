import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/already_have.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../layout/app_layout.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                title: "Done".tr(),
                desc: state.successMessage.tr(),
                btnOkOnPress: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AppLayout(),
                    ),
                  );
                },
              ).show();
            } else if (state is SignUpFailure) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                title: "Error".tr(),
                desc: state.errormessage.tr(),
              ).show();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(64),
                    Text(
                      AppStrings.signUp.tr(),
                      style: TextStyles.bold24BlueBerry,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    SvgPicture.asset(AppAssets.signUp),
                    const Gap(24),
                    const TextForms(),
                    const Gap(24),
                    state is SignUpLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            onPressed: () {
                              context
                                  .read<SignUpCubit>()
                                  .signUpWithEmailAndPassword(context);
                            },
                            text: AppStrings.signUp.tr(),
                          ),
                    const Gap(16),
                    const AlreadyHave(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
