import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      height: 56.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: AppColors.blueBerry,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage(index == 0
                      ? AppAssets.home
                      : index == 1
                          ? AppAssets.learn
                          : index == 2
                              ? AppAssets.profile
                              : AppAssets.settings),
                  color: selectedIndex != index
                      ? AppColors.iconColor
                      : AppColors.orangeColor,
                ),
                const Gap(6),
                Text(
                  index == 0 && selectedIndex == index
                      ? AppStrings.home
                      : index == 1 && selectedIndex == index
                          ? AppStrings.learn
                          : index == 2 && selectedIndex == index
                              ? AppStrings.profile
                              : selectedIndex == index
                                  ? AppStrings.settings
                                  : "",
                  style: TextStyles.regular13orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
