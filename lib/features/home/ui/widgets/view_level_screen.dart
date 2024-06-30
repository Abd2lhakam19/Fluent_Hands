import 'package:fluent_hands/core/helper/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'content_screen.dart';

class ViewLevelScreen extends StatelessWidget {
  ViewLevelScreen(
      {super.key,
      required this.def,
      required this.level,
      required this.lessons});
  String def;
  String level;
  int lessons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEE7EF),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: const Color(0xFFFEE7EF),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5),
                              color: const Color(0xFFFFD301),
                            ),
                            child: Center(child: Text(def)),
                          ),
                          Text(
                            level,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Image(image: AssetImage("assets/images/Right.png"), fit: BoxFit.fill,),
                              SizedBox(width: 5.w),
                              Text(
                                "$lessons Lessons",
                                style: TextStyle(
                                  color: Color(0xFF3A94E6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Letters and Numbers",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text("Arabic letters and numbers"),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Image.asset(
                      AppAssets.badge,
                      height: 192,
                      width: 192,
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
          ),
          Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 25,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => const CustomContentItem(
              number: '01',
              title: 'Welcome',
              subTitle: 'Welcome',
            ),
          ))
        ],
      ),
    );
  }
}

class CustomContentItem extends StatelessWidget {
  const CustomContentItem({
    super.key,
    required this.number,
    required this.title,
    required this.subTitle,
  });
  final String number, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 28, color: Color(0xFFB8B8D2)),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                subTitle,
                style: const TextStyle(color: Color(0xFF3A94E6)),
              ),
            ],
          ),
          const SizedBox(
            width: 140,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentScreen()),
              );
            },
            child: const Icon(
              Icons.play_circle,
              color: Color(0xFF3A94E6),
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
