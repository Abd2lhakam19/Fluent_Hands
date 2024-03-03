import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
class TopWidget extends StatelessWidget {
   TopWidget({
    super.key,
    required this.des
  });
  String des;
  @override
  Widget build(BuildContext context) {
    return Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 152.h,
      width: 345.w,
      decoration: BoxDecoration(
        color: AppColors.pinkColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Gap(33),
            Text(
              des,
              style: TextStyles.medium24Black.copyWith(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            const Gap(40),
            Image.asset(AppAssets.hand),
          ],
        ),
      ),
    );
  }
}
