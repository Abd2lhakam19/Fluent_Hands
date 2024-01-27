import 'package:fluent_hands/core/helper/font_weight_helper.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle bold24BlueBerry = TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.blueBerry,
        fontFamily: 'montserrat',
      ),
      bold14BlueBerry = TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.blueBerry,
        fontFamily: 'montserrat',
      ),
      medium18BlueBerry = TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.blueBerry,
        fontFamily: 'montserrat',
      );
}
