import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helper/app_strings.dart';
import '../level_component.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LevelComponent(
            levelName: AppStrings.level1,
            levelDetails: AppStrings.level1Details,
            defLevel: AppStrings.easy,
          ),
          const Gap(16),
          LevelComponent(
            levelName: AppStrings.level2,
            levelDetails: AppStrings.level2Details,
            defLevel: AppStrings.easy,
          ),
          const Gap(16),
          LevelComponent(
            levelName: AppStrings.level3,
            levelDetails: AppStrings.level3Details,
            defLevel: AppStrings.easy,
          ),
        ],
      ),
    );
  }
}
