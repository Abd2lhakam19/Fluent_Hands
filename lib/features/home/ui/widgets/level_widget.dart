import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:fluent_hands/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import 'view_level_screen.dart';

// ignore: must_be_immutable
class LevelWidget extends StatelessWidget {
  LevelWidget({
    super.key,
    required this.num,
    required this.lessons,
    required this.def,
    required this.level,
    required this.endPoint,
  });
  String num;
  String level;
  String def;
  int lessons;
  String endPoint;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<HomeCubit, HomeStates>(
        bloc: HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio()))),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            height: 216.h,
            width: 253.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 30,
                  color: const Color(0xff3a94e7).withOpacity(0.1),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              width: 60.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFF8E7),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                num,
                                style: TextStyles.medium24Black.copyWith(
                                  fontSize: 45.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              level.tr(),
                              style: TextStyles.semiBold18BlueBerry,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  def.tr(),
                                  style: TextStyles.regular16BlueBerry.copyWith(
                                    color: const Color(0xff4D4D4F),
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "$lessons lessons",
                                  style: TextStyles.regular13orange.copyWith(
                                    color: AppColors.blueColor,
                                    fontSize: 10.sp,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Image.asset(AppAssets.badge),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ButtonWidget(
                    height: 40.h,
                    width: 208.w,
                    backGroundColor: Colors.transparent,
                    borderColor: AppColors.blueColor,
                    onPressed: () async {
                      await context
                          .read<HomeCubit>()
                          .getLevelsData(endPoint)
                          .whenComplete(() {
                        var data = context.read<HomeCubit>().data;
                        var lenght = data.length;
                        log(context.read<HomeCubit>().data.length.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewLevelScreen(
                              def: def,
                              level: level,
                              lessons: lenght,
                              endPoint: endPoint,
                              data: data,
                            ),
                          ),
                        );
                      });
                    },
                    text: "view_level".tr(),
                    textStyle: TextStyles.regular16BlueBerry.copyWith(
                      color: AppColors.blueColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
