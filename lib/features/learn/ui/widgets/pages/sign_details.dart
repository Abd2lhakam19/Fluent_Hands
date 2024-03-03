import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/core/helper/font_weight_helper.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/learn_response.dart';

class SignDetails extends StatefulWidget {
   SignDetails({super.key, required this.word,required this.gifPath});

  String gifPath;
  String word;

  @override
  State<SignDetails> createState() => _SignDetailsState();
}

class _SignDetailsState extends State<SignDetails> {
  Uint8List? imagebyte;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featchImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imagebyte!=null? Image.memory(imagebyte!):  SizedBox(
              height: 100.h,
              child: Center(
                child: const CircularProgressIndicator(),
              ),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 36.w,vertical: 40.h),
              // clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [

                  Text(
                   widget.word,
                    style: TextStyles.medium24Black.copyWith(
                      color: Color(0xff26263f),
                      fontWeight: FontWeightHelper.semiBold,
                    ),
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
                    height: 42.h,
                  ),
                  Text(
                      "Drag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentencesDrag and drop words to form grammatically correct sentences",style: TextStyles.medium24Black.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: Color(0xff8d8c9e),
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void>featchImage() async{
    try {
      final response = await Dio().get(
          EndPoints.baseUrl + widget.gifPath, options: Options(
          headers: {
            'Authorization': EndPoints.basicAuth
          },
          responseType: ResponseType.bytes
      ));
      if(response.statusCode==200){
        setState(() {
          imagebyte = Uint8List.fromList(response.data);
        });

      }
      else
        {
          print("Errorrrr");
        }

    } catch (e){
      throw e;
    }
  }
}

