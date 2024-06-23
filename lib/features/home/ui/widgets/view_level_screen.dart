import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewLevelScreen extends StatelessWidget {
  ViewLevelScreen(
      {super.key,
      required this.def,
      required this.level,
      required this.lessons});
  String def;
  String level;
  int lessons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEE7EF),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xffFFD301),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                def,
                style: TextStyles.semiBold18BlueBerry.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xff4D4D4F),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              level,
              style: TextStyles.semiBold18BlueBerry.copyWith(
                fontSize: 24.sp,
                color: const Color(0xff252526),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "$lessons Lessons".toString(),
              style: TextStyles.regular16BlueBerry.copyWith(
                fontSize: 10.sp,
                color: AppColors.blueColor,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                // height: double.infinity,
                height: 600.h,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
