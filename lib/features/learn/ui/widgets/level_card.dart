import 'package:fluent_hands/features/learn/ui/widgets/level_card_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/level_model.dart';

class LevelCard extends StatelessWidget {
   LevelCard({super.key,required this.levelModel,required this.index});
   int index;
  LevelModel levelModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
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
            child:  LevelCardComponent(levelModel: levelModel,index: index,)),
      ],
    );
  }
}
