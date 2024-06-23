import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/features/home/ui/widgets/scan_sign.dart';
import 'package:fluent_hands/features/home/ui/widgets/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import 'full_text_scan.dart';

class SelectBottomSheet extends StatefulWidget {
  const SelectBottomSheet({super.key});

  @override
  State<SelectBottomSheet> createState() => _SelectBottomSheetState();
}

class _SelectBottomSheetState extends State<SelectBottomSheet> {
  bool fulTextSelected = false;
  bool alphabetsSelected = false;
  bool isTrainigOn = false;
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
              'pick_your_option'.tr(),
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
                        height: 150.h,
                        width: 150.w,
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
                        'full_text'.tr(),
                        style: TextStyles.medium18BlueBerry.copyWith(
                          color: AppColors.blueColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 35.w,
                // ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      alphabetsSelected = !alphabetsSelected;
                      fulTextSelected = false;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'alphabets'.tr(),
                        style: TextStyles.medium18BlueBerry.copyWith(
                          color: AppColors.blueColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            // Checkbox(value: true, onChanged: (value) {}),
            Row(
              children: [
                Text(
                  'Apply Training'.tr(),
                  style: TextStyles.regular16orange.copyWith(
                    color: const Color(0xff120D02),
                  ),
                ),
                const Spacer(),
                Transform.scale(
                  scale: 0.7,
                  child: SizedBox(
                    height: 17.h,
                    width: 32.w,
                    child: Switch(
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xff006AFF),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: isTrainigOn,
                      onChanged: (value) {
                        setState(() {
                          isTrainigOn = !isTrainigOn;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ButtonWidget(
              width: 295.w,
              height: 44.h,
              backGroundColor: AppColors.blueColor,
              onPressed: () {
                if (alphabetsSelected && !fulTextSelected && !isTrainigOn) {
                  setState(() {
                    alphabetsSelected = !alphabetsSelected;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScanSign(
                      training: false,
                    ),
                  ));
                } else if (fulTextSelected &&
                    !alphabetsSelected &&
                    !isTrainigOn) {
                  setState(() {
                    fulTextSelected = !fulTextSelected;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FullTextScan(
                      training: false,
                    ),
                  ));
                } else if (fulTextSelected &&
                    !alphabetsSelected &&
                    isTrainigOn) {
                  setState(() {
                    fulTextSelected = !fulTextSelected;
                    isTrainigOn = !isTrainigOn;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrainingScreen(
                      typeList: "Full Text",
                    ),
                  ));
                } else if (alphabetsSelected &&
                    !fulTextSelected &&
                    isTrainigOn) {
                  setState(() {
                    alphabetsSelected = !alphabetsSelected;
                    isTrainigOn = !isTrainigOn;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrainingScreen(
                      typeList: "Alphabets",
                    ),
                  ));
                }
              },
              text: "start_session".tr(),
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
