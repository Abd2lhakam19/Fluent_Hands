import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  EdgeInsetsGeometry? contentPadding;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;
  Color? backGroundColor;
  TextStyle? hintStyle;
  String hintText;
  bool? isOpscure;
  Widget? suffixIcon;
  TextEditingController? controller;
  Function(String?) validator;

  TextFieldWidget(
      {super.key,
      this.hintStyle,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.backGroundColor,
      required this.hintText,
      this.isOpscure,
      this.suffixIcon,
      this.controller,
      required this.validator(vlaue)});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabled: true,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blueBerry,
                width: 0.7.w,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blueBerry,
                width: 0.7.w,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.7.w,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 0.7.w,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: backGroundColor ?? Colors.transparent,
        filled: true,
        //hintText: hintText,
        // hintStyle: hintStyle ?? TextStyles.regular18BlueBerry,
        suffixIcon: suffixIcon,
        labelStyle: hintStyle ?? TextStyles.regular18BlueBerry,
        labelText: hintText,
      ),
      obscureText: isOpscure ?? false,
      style: TextStyles.medium16BlueBerry,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
