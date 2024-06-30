import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/features/home/ui/widgets/current_level.dart';
import 'package:fluent_hands/features/home/ui/widgets/level_widget.dart';
import 'package:fluent_hands/features/home/ui/widgets/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bottom_sheet.dart';
import '../widgets/contribute_with_us.dart';

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
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD8DADB)),
                      shape: BoxShape.circle,
                      color: Colors.white),
                  child: Image.asset(AppAssets.notification)),
            ),
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
                        des: 'converts_sign_language_to_text'.tr(),
                        label: 'fluent_hands'.tr(),
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
                        des: 'signs_dictionary'.tr(),
                        label: 'contribute_with_us'.tr(),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ContributeWithUs(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  'learning'.tr(),
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
                  'levels'.tr(),
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
                        lessons: 38,
                        def: 'easy'.tr(),
                        level: 'level_one'.tr(),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      LevelWidget(
                        num: "2",
                        lessons: 4,
                        def: 'medium'.tr(),
                        level: 'level_two'.tr(),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      LevelWidget(
                        num: "3",
                        lessons: 4,
                        def: 'hard'.tr(),
                        level: 'level_three'.tr(),
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
