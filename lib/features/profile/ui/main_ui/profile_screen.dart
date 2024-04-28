import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/app_strings.dart';
import 'package:fluent_hands/features/profile/ui/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.loose,
                children: [
                  // Container(
                  //   height: 200.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.orangeColor,
                  //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(160), bottomRight: Radius.circular(160)),
                  //   ),
                  // ),
                  // Gap(0),
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(AppAssets.profile),
                  ),
                ],
              ),
            ],
          ),
          // const Gap(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(20),
                  const Text(
                    AppStrings.changeProfilePicture,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  const Gap(15),
                  const Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                    thickness: 0.5,
                  ),
                  const Gap(20),
                  const Text(
                    textAlign: TextAlign.start,
                    "Profile Information",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Gap(30),
                  ProfileWidget(
                    label: "Name",
                    details: "Mohamed Hatem",
                  ),
                  Gap(20),
                  ProfileWidget(
                    label: "User Name",
                    details: "Mohamed_Hatem",
                  ),
                  Gap(15),
                  Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                    thickness: 0.5,
                  ),
                  Gap(20),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Gap(30),
                  ProfileWidget(
                    label: "Email",
                    details: "Mo.Hatem1911@gmail.com",
                  ),
                  Gap(20),
                  ProfileWidget(
                    label: "Phone Number",
                    details: "01212027475",
                  ),
                  Gap(20),
                  ProfileWidget(
                    label: "Date of Birth",
                    details: "15 June, 2002",
                  ),
                  Gap(20),
                  ProfileWidget(
                    label: "Gender",
                    details: "Male",
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
