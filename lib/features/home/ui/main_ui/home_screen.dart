import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/features/home/ui/widgets/current_level.dart';
import 'package:fluent_hands/features/home/ui/widgets/level_widget.dart';
import 'package:fluent_hands/features/home/ui/widgets/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.h,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Fluent Hands",
            style: TextStyles.medium24Black,
          ),
          actions: [
            Container(
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffD8DADB)),
                    shape: BoxShape.circle,
                    color: Colors.white),
                child: Image.asset(AppAssets.notification)),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TopScreen(
                        imgPath: AppAssets.sign,
                        des: AppStrings.convertSignToText,
                        label: AppStrings.fluentHands,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const SelectBottomSheet(),
                          );
                        },
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      TopScreen(
                        imgPath: AppAssets.letter,
                        des: AppStrings.signsDictionary,
                        label: AppStrings.textToSigns,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  AppStrings.learning,
                  style: TextStyles.bold24BlueBerry.copyWith(
                    color: const Color(0xff252526),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CurrentLevel(),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  AppStrings.levels,
                  style: TextStyles.bold24BlueBerry.copyWith(
                    color: const Color(0xff252526),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      LevelWidget(
                        num: "1",
                        lessons: 22,
                        def: AppStrings.easy,
                        level: AppStrings.level1,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      LevelWidget(
                        num: "2",
                        lessons: 22,
                        def: AppStrings.easy,
                        level: AppStrings.level2,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      LevelWidget(
                        num: "3",
                        lessons: 22,
                        def: AppStrings.easy,
                        level: AppStrings.level3,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
