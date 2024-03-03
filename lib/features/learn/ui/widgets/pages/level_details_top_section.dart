import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../../../core/helper/font_weight_helper.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/text_styles.dart';

class LevelDetailsTopection extends StatelessWidget {
   LevelDetailsTopection({super.key,required this.levelDef,required this.levelName});
  String levelDef;
  String levelName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            //alignment: Alignment.center,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              levelDef,
              style: TextStyles.medium24Black.copyWith(
                  fontWeight: FontWeightHelper.light,
                  fontSize: 12.sp,
                  letterSpacing: 3.w),
            ),
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            levelName,
            style: TextStyles.medium24Black,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "22 Lessons",
            style: TextStyles.medium24Black.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeightHelper.regular,
              color: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
