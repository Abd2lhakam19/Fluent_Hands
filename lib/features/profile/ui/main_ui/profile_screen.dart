import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/text_styles.dart';

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
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""),
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
                "@${FirebaseAuth.instance.currentUser!.displayName ?? "user_name"}",
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
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  width: 343.w,
                  height: 190.h,
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
                            'edit_profile'.tr(),
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
                            'notification'.tr(),
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
                            'sounds'.tr(),
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
