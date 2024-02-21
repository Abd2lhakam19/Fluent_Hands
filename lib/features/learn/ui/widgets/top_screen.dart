import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/text_styles.dart';

// ignore: must_be_immutable
class TopScreen extends StatelessWidget {
  TopScreen({super.key, required this.currentPage});
  int currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          2,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(index == 0
                      ? index == currentPage
                          ? AppAssets.learnTabSelected
                          : AppAssets.learnTabUnSelected
                      : index == currentPage
                          ? AppAssets.examSelected
                          : AppAssets.examUnSelected),
                  const Gap(5),
                  Text(
                    index == 0 ? AppStrings.learn : AppStrings.exam,
                    style: index == currentPage
                        ? TextStyles.medium18BlueBerry
                        : TextStyles.medium18BlueBerry.copyWith(
                            color: AppColors.blueBerry.withOpacity(0.5),
                          ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
