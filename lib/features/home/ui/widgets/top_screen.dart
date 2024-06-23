import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';

// ignore: must_be_immutable
class TopScreen extends StatelessWidget {
  TopScreen(
      {super.key,
      required this.imgPath,
      required this.des,
      required this.label,
      required this.onPressed});
  String imgPath;
  String label;
  String des;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(right: 16.w, left: 16.w, top: 28.h, bottom: 10.h),
      height: 200.h,
      width: 155.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffD8DADB),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 38.h,
              width: 38.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blueColor,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: Image.asset(imgPath),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              label,
              style: TextStyles.medium24Black.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              des,
              style: TextStyles.medium24Black.copyWith(
                fontSize: 12.sp,
                color: const Color(0xff929297),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ButtonWidget(
              width: 75.w,
              height: 31.h,
              backGroundColor: AppColors.blueColor,
              borderRadius: BorderRadius.circular(100),
              onPressed: onPressed,
              text: 'start'.tr(),
              textStyle: TextStyles.bold14BlueBerry.copyWith(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
