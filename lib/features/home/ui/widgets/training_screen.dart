import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:fluent_hands/features/home/ui/widgets/full_text_scan.dart';
import 'package:fluent_hands/features/home/ui/widgets/scan_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';

class TrainingScreen extends StatelessWidget {
  TrainingScreen({super.key, required this.typeList});

  final String typeList;
  final List<String> alphabets = [
    'حرف الالف',
    'حرف الباء',
    'حرف التاء',
    'حرف الثاء',
    'حرف الجيم',
    'حرف الحاء',
    'حرف الخاء',
    'حرف الدال',
    'حرف الذال',
    'حرف الراء',
    'حرف الزاي',
    'حرف السين',
    'حرف الشين',
    'حرف الصاد',
    'حرف الضاد',
    'حرف الطاء',
    'حرف الظاء',
    'حرف العين',
    'حرف الغين',
    'حرف الفاء',
    'حرف القاف',
    'حرف الكاف',
    'حرف اللام',
    'حرف الميم',
    'حرف النون',
    'حرف الهاء',
    'حرف الواو',
    'حرف الياء',
  ];
  final List<String> words = [
    "الحمد لله",
    "السلام عليكم",
    "مع السلامة",
    "مساء الخير",
    "صباح الخير",
    "ايه الاخبار",
    "فرصة سعيدة",
    "انا كويس",
    "انا اسف",
    "مش وحش",
    "لو سمحت",
    "شكرا"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Training",
          style: TextStyles.medium24Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (typeList == "Full Text") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FullTextScan(
                                      training: true,
                                      word: words[index],
                                    ),
                                  ));
                                } else if (typeList == 'Alphabets') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScanSign(
                                      training: true,
                                      word: alphabets[index],
                                    ),
                                  ));
                                }
                              },
                              child: Image.asset(AppAssets.play)),
                          const Spacer(),
                          Text(
                              typeList == "Alphabets"
                                  ? alphabets[index]
                                  : typeList == "Full Text"
                                      ? words[index]
                                      : "",
                              style: TextStyles.regular16BlueBerry),
                          SizedBox(width: 15.w),
                          index + 1 >= 10
                              ? Text("${index + 1}",
                                  style: TextStyles.medium16BlueBerry)
                              : Text("0${index + 1}",
                                  style: TextStyles.medium16BlueBerry),
                        ],
                      ),
                      Divider(
                        height: 30.h,
                        color: Colors.transparent,
                      )
                    ],
                  );
                },
                itemCount: typeList == "Alphabets"
                    ? alphabets.length
                    : typeList == "Full Text"
                        ? words.length
                        : 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
