import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:payment_ui/utils/app_colors.dart';

class Linechart extends StatelessWidget {
  const Linechart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(mainData());
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
    );
    Widget text;
    switch (value) {
      case 1:
        text = const Text('S', style: style);
        break;
      case 2:
        text = const Text('M', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('W', style: style);
        break;
      case 5:
        text = const Text('T', style: style);
        break;
      case 6:
        text = const Text('F', style: style);
        break;
      case 7:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.grey300,
            strokeWidth: 1,
            dashArray: [8, 4],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0.5,
      maxX: 7.5,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0.5, 6),
            FlSpot(1, 5.5),
            FlSpot(2, 4),
            FlSpot(3, 5),
            FlSpot(4, 6),
            FlSpot(5, 4),
            FlSpot(6, 5),
            FlSpot(7, 4),
            FlSpot(7.5, 5),
          ],
          isCurved: true,
          gradient: const LinearGradient(
            colors: [AppColors.green, AppColors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                colors: [
                  AppColors.green,
                  const Color(0xffFFFFFF),
                ].map((color) => color.withOpacity(0.5)).toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ],
    );
  }
}
