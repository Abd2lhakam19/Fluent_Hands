import 'package:fluent_hands/core/cashe/cashe_helper.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding2/main_ui/on_boarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/button_widget.dart';

// ignore: must_be_immutable
class SwitchAndNext extends StatelessWidget {
  SwitchAndNext({super.key, required this.currentPage});
  int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 8.h,
                width: currentPage == index ? 24.w : 8.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: currentPage == index
                        ? AppColors.blueColor
                        : AppColors.blueColor.withOpacity(0.6)),
              ),
            ),
          ),
        ),
        const Gap(110),
        ButtonWidget(
          onPressed: () {
            CacheHelper.sharedPreferences.setBool('isFirstTime', false);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const OnBoarding2(),
            ));
          },
          text: AppStrings.next,
        ),
        const Gap(40),
      ],
    );
  }
}
