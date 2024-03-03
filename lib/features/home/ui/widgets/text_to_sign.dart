import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class TextToSign extends StatefulWidget {
  const TextToSign({super.key});

  @override
  State<TextToSign> createState() => _TextToSignState();
}

class _TextToSignState extends State<TextToSign> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Column(children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: AppColors.blueBerry
                )
              ),
              height: 420.h,
                width: double.infinity,
                child:const ModelViewer(src: 'assets/model/model.glb',
                  ar: true,
        
                ),),
            SizedBox(
              height: 52.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
              height: 165.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(20),
              
              ),
              child: Column(

                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type Somthing",
                      hintStyle: TextStyles.medium24Black.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),

                    ),

                  ),
                  Spacer(
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: Image.asset(AppAssets.send)),
                ],
              ),
            ),
        
          ]),
        ),
      ),
    );
  }
}
