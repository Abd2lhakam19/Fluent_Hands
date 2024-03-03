import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/features/sign_in/ui/main_ui/sign_in.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:fluent_hands/features/sign_up/data/repository/sign_up_repo.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/already_have.dart';
import 'package:fluent_hands/features/sign_up/ui/widgets/forms.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
        create: (context) =>
            SignUpCubit(SingUpRepo(api: DioConsumer(dio: Dio()))),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errormessage),
              ));
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
                      AppStrings.signUp,
                      style: TextStyles.bold24BlueBerry,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    SvgPicture.asset(AppAssets.signUp),
                    const Gap(24),
                    TextForms(),
                    const Gap(24),
                    state is SignUpLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            onPressed: () {
                              context.read<SignUpCubit>().signUp();
                              // if (state is SignUpSuccess) {
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       builder: (context) => const AppLayout(),
                              //     ),
                              //   );
                              // }
                            },
                            text: AppStrings.signUp,
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
