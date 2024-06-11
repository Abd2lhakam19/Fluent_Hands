import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/cashe/cashe_helper.dart';
import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../sign_in/ui/main_ui/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationOn = true;
  bool isSoundsOn = true;
  late String img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      img = context.read<SignInCubit>().imgUrl;
    });
  }

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
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 120.r,
                backgroundImage: NetworkImage(img),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.displayName ?? "User Name",
                style: TextStyles.medium24Black,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "@User_Name",
                style: TextStyles.medium24Black.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xff9E9E9E),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  width: 343.w,
                  height: 252.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFDFDFD),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.editProfile,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            AppStrings.editProfile,
                            style: TextStyles.regular16orange.copyWith(
                              color: const Color(0xff120D02),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.profileNotification,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            AppStrings.notification,
                            style: TextStyles.regular16orange.copyWith(
                              color: const Color(0xff120D02),
                            ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.7,
                            child: SizedBox(
                              height: 17.h,
                              width: 32.w,
                              child: Switch(
                                activeColor: Colors.white,
                                activeTrackColor: const Color(0xff006AFF),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: isNotificationOn,
                                onChanged: (value) {
                                  setState(() {
                                    isNotificationOn = !isNotificationOn;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.volumeUp,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            AppStrings.sounds,
                            style: TextStyles.regular16orange.copyWith(
                              color: const Color(0xff120D02),
                            ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.7,
                            child: SizedBox(
                              height: 17.h,
                              width: 32.w,
                              child: Switch(
                                activeColor: Colors.white,
                                activeTrackColor: const Color(0xff006AFF),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: isSoundsOn,
                                onChanged: (value) {
                                  setState(() {
                                    isSoundsOn = !isSoundsOn;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.language,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            AppStrings.languages,
                            style: TextStyles.regular16orange.copyWith(
                              color: const Color(0xff120D02),
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
                              AppStrings.logOut,
                              style: TextStyles.regular16orange.copyWith(
                                color: const Color(0xff120D02),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
