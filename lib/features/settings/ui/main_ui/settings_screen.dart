import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/cashe/cashe_helper.dart';
import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../localization_checker.dart';
import '../../../sign_in/ui/main_ui/sign_in.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.h,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Fluent Hands",
          style: TextStyles.medium24Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 170.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: const Color(0xffFDFDFD),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.language,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'languages'.tr(),
                        style: TextStyles.regular16orange.copyWith(
                          color: const Color(0xff120D02),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 200.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 25.h),
                                    child: Column(
                                      //  mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'choose_language'.tr(),
                                          style: TextStyles.medium18BlueBerry
                                              .copyWith(
                                            color: AppColors.blueColor,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              style: LocalizationChecker
                                                      .isArabic(context)
                                                  ? TextButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.blueColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          12,
                                                        ),
                                                      ),
                                                      minimumSize:
                                                          Size(90.w, 40.h),
                                                      foregroundColor:
                                                          Colors.white,
                                                    )
                                                  : null,
                                              onPressed: () {
                                                EasyLocalization.of(context)!
                                                    .setLocale(const Locale(
                                                        'ar', 'AE'));
                                                Navigator.pop(context);
                                              },
                                              child: Text('arabic'.tr(),
                                                  style:
                                                      TextStyles.medium24Black),
                                            ),
                                            SizedBox(
                                              width: 16.w,
                                            ),
                                            TextButton(
                                              style: LocalizationChecker
                                                      .isEnglish(context)
                                                  ? TextButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.blueColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          12,
                                                        ),
                                                      ),
                                                      minimumSize:
                                                          Size(90.w, 40.h),
                                                      foregroundColor:
                                                          Colors.white,
                                                    )
                                                  : null,
                                              onPressed: () {
                                                EasyLocalization.of(context)!
                                                    .setLocale(const Locale(
                                                        'en', 'US'));
                                                Navigator.pop(context);
                                              },
                                              child: Text('english'.tr(),
                                                  style:
                                                      TextStyles.medium24Black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.logOut,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.question,
                              animType: AnimType.topSlide,
                              desc: "Are you sure you want to log out?",
                              title: AppStrings.logOut,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () async {
                                await GoogleSignIn().signOut();
                                await FacebookAuth.instance.logOut();
                                await FirebaseAuth.instance.signOut();
                                CacheHelper.sharedPreferences
                                    .setBool('isLogIn', false);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ),
                                );
                              }).show();
                        },
                        child: Text(
                          'logout'.tr(),
                          style: TextStyles.regular16orange.copyWith(
                            color: const Color(0xff120D02),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          AwesomeDialog(
                              context: context,
                              body: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Are you sure?'),
                                  Text('This action cannot be undone.'),
                                ],
                              ),
                              dialogType: DialogType.warning,
                              animType: AnimType.topSlide,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () async {
                                final user = FirebaseAuth.instance.currentUser;
                                await user!.delete();
                                await GoogleSignIn().signOut();
                                await FacebookAuth.instance.logOut();
                                await FirebaseAuth.instance.signOut();

                                CacheHelper.sharedPreferences
                                    .setBool('isLogIn', false);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ),
                                );
                              }).show();
                        },
                        child: Text(
                          'delete'.tr(),
                          style: TextStyles.regular16orange.copyWith(
                            color: const Color(0xff120D02),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
