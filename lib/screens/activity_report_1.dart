import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_ui/utils/app_colors.dart';
import 'package:payment_ui/utils/app_sizes.dart';
import 'package:payment_ui/utils/custom_textstyle.dart';
import 'package:payment_ui/utils/image_util.dart';
import 'package:payment_ui/widgets/line_chart.dart';
import 'package:payment_ui/widgets/white_box.dart';

class ActivityReport1 extends StatefulWidget {
  const ActivityReport1({super.key});

  @override
  State<ActivityReport1> createState() => _ActivityReport1State();
}

class _ActivityReport1State extends State<ActivityReport1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            gapH12,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WhiteBox(
                      boxBorder: Border.all(color: AppColors.grey100),
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      borderRadius: 12,
                      width: 40,
                      child: SvgPicture.asset(ImageUtil.chevronLeft)),
                  Text(
                    "Activity",
                    style: CustomTextStyle.t20700(),
                  ),
                  WhiteBox(
                      boxBorder: Border.all(color: AppColors.grey100),
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      borderRadius: 12,
                      width: 40,
                      child: SvgPicture.asset(ImageUtil.dots)),
                ],
              ),
            ),
            gapH24,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      gapH16,
                      WhiteBox(
                          borderRadius: 16,
                          height: 64.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          color: AppColors.green,
                          child: Row(
                            children: [
                              Text("Co.payment Cards",
                                  style: CustomTextStyle.t14600()),
                              const Spacer(),
                              Text("**** 1121",
                                  style: CustomTextStyle.t14600()),
                              gapW16,
                              SvgPicture.asset(ImageUtil.circleIcon)
                            ],
                          )),
                      gapH16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) => Container(
                                width: 6.w,
                                height: 6.w,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: 0 == index
                                      ? AppColors.blue100
                                      : AppColors.grey200,
                                ))),
                      ),
                      gapH20,
                      WhiteBox(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          borderRadius: 16,
                          boxBorder: Border.all(color: AppColors.grey300),
                          child: Column(
                            children: [
                              Text(
                                "Total Spending",
                                style: CustomTextStyle.t14500(
                                    color: AppColors.grey200),
                              ),
                              gapH4,
                              Text(
                                "\$5,215.00",
                                style: CustomTextStyle.t24700(
                                    color: AppColors.grey200),
                              ),
                              gapH24,
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: ["Day", "Week", "Month", "Year"]
                                      .map((e) => SizedBox(
                                            height: 32.h,
                                            child: Text(
                                              e,
                                              style: e == "Week"
                                                  ? CustomTextStyle.t14600(
                                                      color: Colors.black)
                                                  : CustomTextStyle.t14500(
                                                      color: AppColors.grey200),
                                            ),
                                          ))
                                      .toList()),
                              gapH24,
                              const SizedBox(height: 180, child: Linechart()),
                            ],
                          )),
                      gapH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Transactions",
                            style: CustomTextStyle.t24700(),
                          ),
                          Row(
                            children: [
                              Text(
                                "All ",
                                style: CustomTextStyle.t14500(
                                    color: AppColors.blue100),
                              ),
                              SvgPicture.asset(ImageUtil.chevronDown)
                            ],
                          )
                        ],
                      ),
                      gapH24,
                      Row(
                        children: [
                          WhiteBox(
                              boxBorder: Border.all(color: AppColors.grey100),
                              height: 40,
                              borderRadius: 12,
                              width: 40,
                              child: SvgPicture.asset(
                                ImageUtil.apple,
                                colorFilter: const ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              )),
                          gapW16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Apple",
                                style: CustomTextStyle.t14600(
                                    color: AppColors.blue100),
                              ),
                              gapH4,
                              Text(
                                "Payment",
                                style: CustomTextStyle.t12500(
                                    color: AppColors.grey200),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            "- \$59.00",
                            style: CustomTextStyle.t14600(
                                color: AppColors.blue100),
                          ),
                        ],
                      ),
                      gapH32,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
