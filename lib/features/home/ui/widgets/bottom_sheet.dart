import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/home/ui/widgets/scan_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';

class SelectBottomSheet extends StatefulWidget {
  const SelectBottomSheet({super.key});

  @override
  State<SelectBottomSheet> createState() => _SelectBottomSheetState();
}

class _SelectBottomSheetState extends State<SelectBottomSheet> {
  bool fulTextSelected = false;
  bool alphabetsSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.pickYourOption,
              style: TextStyles.medium18BlueBerry.copyWith(
                color: AppColors.blueColor,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      fulTextSelected = !fulTextSelected;
                      alphabetsSelected = false;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 169.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(
                            color: fulTextSelected && !alphabetsSelected
                                ? AppColors.blueColor
                                : const Color(0xffC6C6C6),
                          ),
                        ),
                        child: Image.asset(
                          AppAssets.fullText,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.fullText,
                        style: TextStyles.medium18BlueBerry.copyWith(
                          color: AppColors.blueColor,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          alphabetsSelected = !alphabetsSelected;
                          fulTextSelected = false;
                        });
                      },
                      child: Container(
                        height: 169.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(
                            color: alphabetsSelected && !fulTextSelected
                                ? AppColors.blueColor
                                : const Color(0xffC6C6C6),
                          ),
                        ),
                        child: Image.asset(
                          AppAssets.alphabets,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppStrings.alphabets,
                      style: TextStyles.medium18BlueBerry.copyWith(
                        color: AppColors.blueColor,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ButtonWidget(
              width: 295.w,
              height: 44.h,
              backGroundColor: AppColors.blueColor,
              onPressed: () {
                if (alphabetsSelected && !fulTextSelected) {
                  setState(() {
                    alphabetsSelected = !alphabetsSelected;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScanSign(),
                  ));
                }
              },
              text: "Start Session",
              textStyle: TextStyles.bold14BlueBerry.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
