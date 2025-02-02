import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';

class CurrentLevel extends StatelessWidget {
  const CurrentLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                        progressColor: AppColors.blueColor,
                        percent: 37 / 100,
                        reverse: true,
                        center: Text(
                          "37 %",
                          style: TextStyles.medium24Black.copyWith(
                              color: AppColors.blueColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeightHelper.semiBold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'level_one'.tr(),
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
                          "continue_your_journey".tr(),
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
                  height: 45.h,
                ),
                // ButtonWidget(
                //   onPressed: () {},
                //   text: "continue_studying".tr(),
                //   backGroundColor: AppColors.blueColor,
                //   height: 44.h,
                //   borderRadius: BorderRadius.circular(20),
                //   width: 295.w,
                //   textStyle: TextStyles.medium24Black
                //       .copyWith(color: Colors.white, fontSize: 14.sp),
                // ),
                Text(
                  "Keep pushing. You got this!",
                  style: TextStyles.medium24Black.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
