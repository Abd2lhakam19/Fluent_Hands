import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/model/on_boarding_model.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/widgets/illustrator_and_description.dart';
import 'package:fluent_hands/features/on_boarding/on_boarding1/widgets/switch_and_next.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int _currentPage = 0;
  List<OnBoardingModel> screens = [
    OnBoardingModel(
        title: AppStrings.translation,
        svgPic: AppAssets.onBoarding1,
        dec: AppStrings.unlockTheWorled),
    OnBoardingModel(
        title: AppStrings.learning,
        svgPic: AppAssets.onBoarding2,
        dec: AppStrings.speakWithoutWords),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(64),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  final item = screens[index];
                  return Column(
                    children: [
                      Text(
                        item.title,
                        style: TextStyles.bold24BlueBerry,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(72),
                      IllustAndDescription(
                        svgPic: item.svgPic,
                        dec: item.dec,
                      ),
                    ],
                  );
                },
                itemCount: screens.length,
              ),
            ),
            const Gap(48),
            SwitchAndNext(
              currentPage: _currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
