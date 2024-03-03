import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/features/learn/cubit/learn_cubit.dart';
import 'package:fluent_hands/features/learn/cubit/learn_states.dart';

import 'package:fluent_hands/features/learn/ui/widgets/current_level.dart';
import 'package:fluent_hands/features/learn/ui/widgets/level_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/level_model.dart';
import '../widgets/top_widget.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});


  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    LearnCubit learnCubit = LearnCubit.get(context);
    List<LevelModel> levels = [
      LevelModel(
          levelNum: "1",
          levelName: AppStrings.level1,
          levelDef: AppStrings.easy,
          levelLessons: "22 Lessons",
          response: learnCubit.welcomeList),
      LevelModel(
          levelNum: "2",
          levelName: AppStrings.level2,
          levelDef: AppStrings.interMediate,
          levelLessons: "22 Lessons",
          response: learnCubit.generalList),
      LevelModel(
          levelNum: "3",
          levelName: AppStrings.level3,
          levelDef: AppStrings.advanced,
          levelLessons: "22 Lessons",
          response: learnCubit.trafficList)
    ];
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<LearnCubit, LearnStates>(
          builder: (context, state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 7.h),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.learn,
                      style: TextStyles.medium24Black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TopWidget(
                      des: AppStrings.starLearning,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CurrentLevel(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppStrings.levels,
                      style: TextStyles.medium24Black.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => LevelCard(
                                levelModel: levels[index],
                            index: index,
                              ),
                          separatorBuilder: (context, index) =>
                              const VerticalDivider(
                                width: 17,
                                color: Colors.transparent,
                              ),
                          itemCount: 3),
                    ),
                    // const LevelCard()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
