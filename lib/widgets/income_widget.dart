import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_ui/utils/app_colors.dart';
import 'package:payment_ui/utils/app_sizes.dart';
import 'package:payment_ui/utils/custom_textstyle.dart';
import 'package:payment_ui/widgets/white_box.dart';

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle, icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WhiteBox(
          padding: EdgeInsets.all(12.w),
          borderRadius: 16,
          boxBorder: Border.all(color: AppColors.grey300),
          child: Row(
            children: [
              WhiteBox(
                  height: 40,
                  color: const Color(0xffF9FAFB),
                  padding: const EdgeInsets.all(10),
                  borderRadius: 12,
                  width: 40,
                  child: SvgPicture.asset(icon)),
              gapW12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.t12400(color: AppColors.grey200),
                  ),
                  gapH4,
                  Text(
                    subtitle,
                    style: CustomTextStyle.t14600(color: AppColors.blue100),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
