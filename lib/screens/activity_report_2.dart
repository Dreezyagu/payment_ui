import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_ui/utils/app_colors.dart';
import 'package:payment_ui/utils/app_sizes.dart';
import 'package:payment_ui/utils/custom_textstyle.dart';
import 'package:payment_ui/utils/image_util.dart';
import 'package:payment_ui/widgets/categories_widget.dart';
import 'package:payment_ui/widgets/income_widget.dart';
import 'package:payment_ui/widgets/white_box.dart';

class ActivityReport2 extends StatefulWidget {
  const ActivityReport2({super.key});

  @override
  State<ActivityReport2> createState() => _ActivityReport2State();
}

class _ActivityReport2State extends State<ActivityReport2> {
  final double width = 12;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 2, 2.5);
    final barGroup2 = makeGroupData(1, 1, 3);
    final barGroup3 = makeGroupData(2, 2.5, 4);
    final barGroup4 = makeGroupData(3, 1.5, 3);
    final barGroup5 = makeGroupData(4, 3, 4);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

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
                      Text(
                        "Total Spending",
                        style: CustomTextStyle.t14500(color: AppColors.grey200),
                      ),
                      gapH8,
                      Text(
                        "\$5,215.00",
                        style: CustomTextStyle.t24700(color: AppColors.grey200),
                      ),
                      gapH32,
                      SizedBox(
                        height: 193.h,
                        child: BarChart(
                          BarChartData(
                            maxY: 4,
                            minY: 0,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (a, b, c, d) => null,
                              ),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42.h,
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28.h,
                                  interval: 1,
                                  getTitlesWidget: rightTitles,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) {
                                return const FlLine(
                                  color: AppColors.grey300,
                                  strokeWidth: 1,
                                  dashArray: [10, 2],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      gapH24,
                      Row(
                        children: [
                          const IncomeWidget(
                            title: "Income",
                            subtitle: "\$5,300.00",
                            icon: ImageUtil.arrowUp,
                          ),
                          gapW16,
                          const IncomeWidget(
                            title: "Expense",
                            subtitle: "\$2,265.80",
                            icon: ImageUtil.arrowDown,
                          ),
                        ],
                      ),
                      gapH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Categories",
                            style: CustomTextStyle.t24700(),
                          ),
                          Row(
                            children: [
                              Text(
                                "Expense ",
                                style: CustomTextStyle.t14500(
                                    color: AppColors.blue100),
                              ),
                              SvgPicture.asset(ImageUtil.chevronDown)
                            ],
                          )
                        ],
                      ),
                      gapH16,
                      SizedBox(
                        height: 134.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoriesWidget(
                              icon: ImageUtil.house,
                              title: "Investments",
                              subtitle: "\$2,265.80",
                            ),
                            CategoriesWidget(
                              icon: ImageUtil.car,
                              title: "Travelling",
                              subtitle: "\$312.52",
                            ),
                            CategoriesWidget(
                              icon: ImageUtil.crown,
                              title: "Subscriptions",
                              subtitle: "\$117.80",
                            ),
                          ],
                        ),
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

  Widget rightTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.grey200,
      fontSize: 12.sp,
    );
    String text;
    if (value == 0) {
      text = '\$0';
    } else if (value == 1) {
      text = '\$1k';
    } else if (value == 2) {
      text = '\$2k';
    } else if (value == 3) {
      text = '\$3k';
    } else if (value == 4) {
      text = '\$4k';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'Dec 27',
      'Dec 28',
      'Dec 29',
      'Dec 30',
      'Dec 31',
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: AppColors.grey200,
        fontSize: 12.sp,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: AppColors.green,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: AppColors.blue100,
          width: width,
        ),
      ],
    );
  }
}
