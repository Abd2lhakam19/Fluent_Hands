import 'package:fluent_hands/features/learn/cubit/learn_cubit.dart';
import 'package:fluent_hands/features/learn/cubit/learn_states.dart';
import 'package:fluent_hands/features/learn/data/models/learn_response.dart';
import 'package:fluent_hands/features/learn/ui/widgets/pages/sign_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_assets.dart';
import '../../../../../core/helper/font_weight_helper.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/text_styles.dart';

class ContentSection extends StatelessWidget {
   ContentSection({super.key,required this.ind});

  int ind;
  List<ListSuccess>? response ;


  @override

 // LearnCubit learnCubit =  LearnCubit();
  @override
  Widget build(BuildContext context) {

  //  print(widget.response.listSuccess?.length??0);
    return BlocBuilder<LearnCubit, LearnStates>(
     // bloc: learnCubit,
        builder: (context, state) {

      switch (state) {
        case LearnLoadingState():
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case LearnFailureState():
          {
            return const Center(
              child: Text("Error While Loading"),
            );
          }
        case LearnSuccessState():
          {
         //  var response = state.listSuccess;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Content",
                  style: TextStyles.medium24Black.copyWith(
                    color: Color(0xff262635),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Content of the level",
                  style: TextStyles.medium24Black.copyWith(
                    color: Color(0xff8d8c9e),
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        response = context.read<LearnCubit>().getList(ind);
                        return Row(
                            children: [
                              Text(
                                (index+1)<10?"0${index+1}":"${index+1}",
                                style: TextStyles.medium24Black.copyWith(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeightHelper.semiBold,
                                    color: Color(0xffb8b8d2),
                                    letterSpacing: 2),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 18.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                response![index].wordName!,
                                 //  context.read<LearnCubit>().welcomeList![index].wordName! ,
                                    style: TextStyles.medium24Black.copyWith(
                                      color: Color(0xff585769),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeightHelper.regular,
                                    ),
                                  ),
                                  Text(
                                   ind==0? "Welcoming":ind==1?"General Words":"Traffic",
                                    style: TextStyles.medium24Black.copyWith(
                                      color: AppColors.orangeColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeightHelper.semiBold,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                           SignDetails(word: response![index].wordName!,gifPath: response![index].imagePath!,),
                                     // SignDetails(word: context.read<LearnCubit>().welcomeList![index].wordName!,gifPath: context.read<LearnCubit>().welcomeList![index].imagePath!,),
                                    ));
                                  },
                                  child: Image.asset(AppAssets.play)),
                            ],
                          );
                      },
                      separatorBuilder: (context, index) => Divider(
                            height: 30.h,
                            color: Colors.transparent,
                          ),
                      itemCount: context.read<LearnCubit>().getLength(ind)
                    //response?.length??0
                     //context.read<LearnCubit>().welcomeList!.length
           ),
                ),
              ],
            );
          }
      }
    });
  }
}
