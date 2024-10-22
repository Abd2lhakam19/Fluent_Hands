import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_states.dart';
import 'package:fluent_hands/features/sign_in/ui/widgets/dont_have_account.dart';
import 'package:fluent_hands/features/sign_in/ui/widgets/sign_in_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../layout/app_layout.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          if (state is SignInSuccess) {
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
                }).show();
          } else if (state is SignInFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: "Error".tr(),
              desc: state.errormessage.tr(),
            ).show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(64),
                    Text(
                      AppStrings.signIn.tr(),
                      style: TextStyles.bold24BlueBerry,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    SvgPicture.asset(AppAssets.signUp),
                    const Gap(24),
                    const SignInForms(),
                    const Gap(10),
                    Text(
                      AppStrings.forgetPassword,
                      style: TextStyles.regular13orange.copyWith(
                        color: AppColors.blueColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const Gap(24),
                    state is SignInLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ButtonWidget(
                            onPressed: () {
                              context
                                  .read<SignInCubit>()
                                  .signInWithEmailAndPassword(context);
                            },
                            text: AppStrings.signIn.tr(),
                          ),
                    const Gap(16),
                    const DontHaveAccount(),
                    const Gap(32),
                    const Divider(
                      indent: 48,
                      endIndent: 48,
                      thickness: 2,
                    ),
                    const Gap(24),
                    Text(
                      AppStrings.orSignInWith.tr(),
                      style: TextStyles.semiBold18BlueBerry,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<SignInCubit>()
                                .signInWithGoogle(context);
                          },
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Image.asset(
                              AppAssets.googleIcon,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await context
                                .read<SignInCubit>()
                                .signInWithFacebook(context);
                          },
                          child: const Icon(
                            Icons.facebook_rounded,
                            color: AppColors.blueColor,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await context
                                .read<SignInCubit>()
                                .signInWithTwitter(context);
                          },
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Image.asset(
                              AppAssets.twitter,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
