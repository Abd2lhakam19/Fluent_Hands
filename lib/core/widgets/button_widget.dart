import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backGroundColor;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? borderColor;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backGroundColor,
      this.borderRadius,
      this.height,
      this.width,
      this.textStyle,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backGroundColor ?? AppColors.orangeColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size((width ?? double.infinity).w, (height ?? 48).h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyles.medium18BlueBerry,
      ),
    );
  }
}
