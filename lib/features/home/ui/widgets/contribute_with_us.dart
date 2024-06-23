import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/widgets/button_widget.dart';
import 'package:fluent_hands/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/theming/text_styles.dart';

class ContributeWithUs extends StatelessWidget {
  ContributeWithUs({super.key});
  XFile? videoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fluent Hands",
          style: TextStyles.medium24Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Contribute with us\nto support Fluent Hands",
                style: TextStyles.bold14BlueBerry.copyWith(
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h, //20
              ),
              TextFieldWidget(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.blueColor,
                    width: 0.7.w,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                hintText: "Type The Word",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter The Word";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: chooseVideo,
                child: Container(
                  height: 150.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      border: Border.all(
                        color: const Color(0xffD8DADB),
                      )),
                  child: Image.asset(
                    AppAssets.alphabets,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Upload The Video",
                style: TextStyles.medium18BlueBerry.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.blueColor,
                ),
              ),
              SizedBox(
                height: 160.h,
              ),
              ButtonWidget(
                text: "Submit",
                onPressed: () {
                  if (videoPath == null) {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            title: "Please Upload The Video",
                            desc: "",
                            btnOkOnPress: () {},
                            btnOkText: "Ok",
                            btnOkColor: AppColors.blueColor)
                        .show();
                  } else {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            title: "Thank You For Your Contribution",
                            desc: "We Will Review It Soon",
                            btnOkOnPress: () async {
                              if (videoPath != null) {
                                await uploadVideo(File(videoPath!.path));
                                videoPath = null;
                              }
                            },
                            btnOkText: "Ok",
                            btnOkColor: AppColors.blueColor)
                        .show();
                  }
                },

                // height: 50.h,
                //  width: 200.w,
              )
            ],
          ),
        ),
      ),
    );
  }

  chooseVideo() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickVideo(source: ImageSource.gallery).then((value) {
      if (value != null) {
        videoPath = value;
        // print("value : ${value.path}");
      }
    });
  }

  Future<void> uploadVideo(File videoPath) async {
    Reference imgRef = FirebaseStorage.instance.ref(basename(videoPath.path));
    await imgRef.putFile(videoPath);
    await imgRef.getDownloadURL();
  }
}
