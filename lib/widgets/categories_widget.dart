import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_ui/utils/app_colors.dart';
import 'package:payment_ui/utils/app_sizes.dart';
import 'package:payment_ui/utils/custom_textstyle.dart';
import 'package:payment_ui/widgets/white_box.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle, icon;
  @override
  Widget build(BuildContext context) {
    return WhiteBox(
      width: 120.w,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 16,
      color: const Color(0xffF9FAFB),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          const Spacer(),
          Text(
            title,
            style: CustomTextStyle.t12400(color: AppColors.grey200),
          ),
          gapH4,
          Text(
            subtitle,
            style: CustomTextStyle.t16700(color: AppColors.blue100),
          )
        ],
      ),
    );
  }
}
