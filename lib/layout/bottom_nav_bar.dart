import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 20.h),
      height: 70.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
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
                              ? AppAssets.settings
                              : AppAssets.profile),
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
                              ? AppStrings.settings
                              : selectedIndex == index
                                  ? AppStrings.profile
                                  : "",
                  style: TextStyles.regular13orange.copyWith(
                    color: AppColors.orangeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
