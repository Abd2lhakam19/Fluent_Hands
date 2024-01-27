import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/text_styles.dart';

// ignore: must_be_immutable
class IllustAndDescription extends StatelessWidget {
  IllustAndDescription({super.key, required this.svgPic, required this.dec});
  String svgPic;
  String dec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgPic),
        const Gap(56),
        Text(
          dec,
          style: TextStyles.bold14BlueBerry,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
