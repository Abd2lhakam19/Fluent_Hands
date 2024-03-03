import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';

class CurrentLevel extends StatelessWidget {
  const CurrentLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.currentLevel,
          style: TextStyles.medium24Black.copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          height: 184.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 30,
                  color: const Color(0xff3a94e7).withOpacity(0.1),
                ),
              ]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                      child: CircularPercentIndicator(
                        radius: 36,
                        lineWidth: 6,
                        progressColor: AppColors.orangeColor,
                        percent: 0,
                        reverse: true,
                        center: Text("0 %",style: TextStyles.medium24Black.copyWith(
                          color: AppColors.orangeColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.semiBold
                        ),),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.level1,
                          style: TextStyles.medium24Black.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff4d4d4f),
                          ),
                        ),
                        Text(
                          "Welcoming Someone",
                          style: TextStyles.medium24Black.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Continue Your Journey!",
                          style: TextStyles.medium24Black.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                ButtonWidget(
                  onPressed: () {},
                  text: "Continue Studying",
                  height: 44.h,
                  borderRadius: BorderRadius.circular(20),
                  width: 295.w,
                  textStyle: TextStyles.medium24Black
                      .copyWith(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
