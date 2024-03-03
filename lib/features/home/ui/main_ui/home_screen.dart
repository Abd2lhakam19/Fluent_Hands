import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/features/home/ui/widgets/scan_sign.dart';
import 'package:fluent_hands/features/home/ui/widgets/text_to_sign.dart';
import 'package:fluent_hands/features/learn/ui/widgets/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<TopWidget> topWidget = [
  //   TopWidget(des: "Scan Your\nHand And\nGet The word"),
  //   TopWidget(des: "Use Our\navatar to\nget the sign")
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
            
                    Text(
                      "Marhaba ",
                      style: TextStyles.bold24BlueBerry,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Image.asset(AppAssets.hello),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                 // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40)
                  ),
                    child: Image.asset(AppAssets.salam)),
                SizedBox(
                  height: 24.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
            
                    children: [
                      TopWidget(des: "Scan Your\nHand And\nGet The word"),
                      SizedBox(
                        width: 20.w,
                      ),
                      TopWidget(des: "Use Our\navatar to\nget the sign"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanSign(),));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                          alignment: Alignment.center,
                          height: 150.h,
                          width: 200.w,
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
                          child:Text("Sign To Text",style: TextStyles.bold24BlueBerry.copyWith(
                            color: AppColors.orangeColor
                          ),textAlign: TextAlign.center,) ,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TextToSign(),));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
                          alignment: Alignment.center,
                          height: 150.h,
                          width: 200.w,
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
                          child: Text("Text To Sign",style: TextStyles.bold24BlueBerry.copyWith(
                              color: AppColors.orangeColor
                          ),textAlign: TextAlign.center,) ,
                        ),
                      ),
                    ],
                  ),
                ),

            
                // Center(
                //   child: ButtonWidget(
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => ScanSign(),
                //       ));
                //     },
                //     text: "Scan Your sign",
                //     textStyle: TextStyles.medium24Black
                //         .copyWith(color: AppColors.orangeColor, fontSize: 14.sp),
                //     height: 44.h,
                //     width: 208.w,
                //     backGroundColor: Colors.transparent,
                //     borderColor: AppColors.orangeColor,
                //   ),
                // ),
                // SizedBox(
                //   height: 50.h,
                // ),
                // Center(
                //   child: ButtonWidget(
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => const TextToSign(),
                //       ));
                //     },
                //     text: "Convert Your Text",
                //     textStyle: TextStyles.medium24Black
                //         .copyWith(color: AppColors.orangeColor, fontSize: 14.sp),
                //     height: 44.h,
                //     width: 208.w,
                //     backGroundColor: Colors.transparent,
                //     borderColor: AppColors.orangeColor,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
