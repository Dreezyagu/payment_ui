import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_ui/utils/app_colors.dart';

class CustomTextStyle {
  static TextStyle t24700({Color? color}) {
    return TextStyle(
        fontSize: 24.sp, color: AppColors.blue100, fontWeight: FontWeight.w700);
  }

  static TextStyle t20700({Color? color}) {
    return TextStyle(
        fontSize: 20.sp, color: AppColors.blue100, fontWeight: FontWeight.w700);
  }

  static TextStyle t16700({Color? color}) {
    return TextStyle(
        fontSize: 16.sp, color: AppColors.blue100, fontWeight: FontWeight.w700);
  }

  static TextStyle t14600({Color? color}) {
    return TextStyle(
        fontSize: 14.sp,
        color: color ?? AppColors.white,
        fontWeight: FontWeight.w600);
  }

  static TextStyle t14700({Color? color}) {
    return TextStyle(
        fontSize: 14.sp, color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle t14500({Color? color}) {
    return TextStyle(
        fontSize: 14.sp, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle t12500({Color? color}) {
    return TextStyle(
        fontSize: 12.sp, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle t12400({Color? color}) {
    return TextStyle(fontSize: 12.sp, color: color);
  }
}
