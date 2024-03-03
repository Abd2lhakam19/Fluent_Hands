import 'package:fluent_hands/features/learn/cubit/learn_cubit.dart';
import 'package:fluent_hands/features/learn/data/models/level_model.dart';
import 'package:fluent_hands/features/learn/ui/widgets/pages/level_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/button_widget.dart';

class LevelCardComponent extends StatelessWidget {
  LevelCardComponent({super.key, required this.levelModel,required this.index});

  LevelModel levelModel;
  int index;

  @override
  Widget build(BuildContext context) {
    print(levelModel.response!.length??0);
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          levelModel.levelNum,
                          style: TextStyles.medium24Black
                              .copyWith(color: Colors.black, fontSize: 55.sp),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          levelModel.levelName,
                          style: TextStyles.medium24Black.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeightHelper.semiBold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Image.asset(AppAssets.badge)
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      levelModel.levelDef,
                      style: TextStyles.medium24Black.copyWith(
                        color: const Color(0xff4d4d4f),
                        fontWeight: FontWeightHelper.regular,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      levelModel.levelLessons,
                      style: TextStyles.medium24Black.copyWith(
                        color: AppColors.orangeColor,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          ButtonWidget(
            onPressed: () {
              print(levelModel.response);

              if(levelModel.levelNum=="1") {
                print("level One Nameeeeeee${levelModel.levelName}");
                context.read<LearnCubit>().getWelcomeWords();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      LevelDetails(response: context
                          .read<LearnCubit>()
                          .welcomeList!,index: index,levelName: levelModel.levelName,levelDef: levelModel.levelDef,),));
              }
              else if(levelModel.levelNum=="2")
                {
                  print("level Two Nameeeeeee${levelModel.levelName}");
                  context.read<LearnCubit>().getGeneralWords();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LevelDetails(response: context
                            .read<LearnCubit>()
                            .generalList!,index: index,levelName: levelModel.levelName,levelDef: levelModel.levelDef,),));
                }
              else{
                print("level Three Nameeeeeee${levelModel.levelName}");
                context.read<LearnCubit>().getTrafficWords();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      LevelDetails(response: context
                          .read<LearnCubit>()
                          .trafficList!,index: index,levelName: levelModel.levelName,levelDef: levelModel.levelDef,),));
              }
            },
            text: "View Level",
            textStyle: TextStyles.medium24Black
                .copyWith(color: AppColors.orangeColor, fontSize: 14.sp),
            height: 44.h,
            width: 208.w,
            backGroundColor: Colors.transparent,
            borderColor: AppColors.orangeColor,
          )
        ],
      ),
    );
  }
}
