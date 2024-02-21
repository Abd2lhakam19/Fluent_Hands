import 'package:fluent_hands/features/learn/ui/widgets/pages/exam_page.dart';
import 'package:fluent_hands/features/learn/ui/widgets/pages/leran_page.dart';
import 'package:fluent_hands/features/learn/ui/widgets/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopScreen(
                currentPage: _currentPage,
              ),
              const Gap(32),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  children: const [
                    LearnPage(),
                    ExamPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
