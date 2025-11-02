import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/font_weights.dart';

class TextStyles {
  // Headings
  static TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.blackcolor,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semibold,
    color: ColorsManager.blackcolor,
  );

  // Subtitles
  static TextStyle subtitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.greycolor,
  );

  // Body
  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManager.darkblue,
  );

  // Buttons
  static TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.white,
  );

  // Hints / small texts
  static TextStyle hintText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManager.textlightgrey,
  );

  static TextStyle smallText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManager.greycolor,
  );

  static TextStyle font15semiboldprimary = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.semibold,
      color: ColorsManager.primary);

  static TextStyle taskTitle = TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.blackcolor);
}
