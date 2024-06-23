import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
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
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      height: 70.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage(index == 0
                      ? AppAssets.home
                      : index == 1
                          ? AppAssets.settings
                          : AppAssets.profile),
                  color: selectedIndex != index
                      ? AppColors.iconColor
                      : AppColors.blueColor,
                ),
                const Gap(6),
                Text(
                  index == 0 && selectedIndex == index
                      ? 'home'.tr()
                      : index == 1 && selectedIndex == index
                          ? 'settings'.tr()
                          : selectedIndex == index
                              ? 'profile'.tr()
                              : "",
                  style: TextStyles.regular13orange.copyWith(
                    color: AppColors.blueColor,
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
