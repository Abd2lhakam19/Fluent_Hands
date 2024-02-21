import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';

// ignore: must_be_immutable
class LevelComponent extends StatelessWidget {
  LevelComponent(
      {super.key,
      required this.levelName,
      required this.levelDetails,
      required this.defLevel});
  String levelName;
  String levelDetails;
  String defLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: 343.h,
      height: 176,
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            levelName,
            style: TextStyles.medium18BlueBerry.copyWith(
              color: Colors.white,
            ),
          ),
          const Gap(12),
          Text(
            levelDetails,
            style: TextStyles.regular16BlueBerry.copyWith(
              color: AppColors.detailsColor,
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                defLevel,
                style: TextStyles.regular13orange.copyWith(
                  color: Colors.white,
                ),
              ),
              Image.asset(AppAssets.next),
            ],
          ),
        ],
      ),
    );
  }
}
