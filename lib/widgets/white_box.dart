import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_ui/utils/app_colors.dart';

class WhiteBox extends StatelessWidget {
  final double? width, height, borderRadius;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  final BoxBorder? boxBorder;
  final Color? color;

  const WhiteBox(
      {super.key,
      this.width,
      this.height,
      required this.child,
      this.padding,
      this.borderRadius,
      this.boxBorder,
      this.color,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          border: boxBorder,
          color: color ?? AppColors.white),
      child: child,
    );
  }
}
