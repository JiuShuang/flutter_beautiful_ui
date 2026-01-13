import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';

class AnalyticsAddBarChart extends StatefulWidget {
  final double width;
  final double height;
  const AnalyticsAddBarChart({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<AnalyticsAddBarChart> createState() => _AnalyticsAddBarChartState();
}

class _AnalyticsAddBarChartState extends State<AnalyticsAddBarChart> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.33,
      height: widget.height * 0.4,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Add by Month", style: TextTheme.of(context).bodyMedium),
          Expanded(
            child: SizedBox(
              width: widget.width * 0.25,
              child: BarChart(
                BarChartData(
                  rotationQuarterTurns: 1,
                  rangeAnnotations: RangeAnnotations(),
                  barGroups: barGroups,
                  barTouchData: barTouchData,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getTitles,
                        reservedSize: 30,
                      ),
                    ),
                    topTitles: AxisTitles(drawBelowEverything: false),
                    leftTitles: AxisTitles(drawBelowEverything: false),
                    rightTitles: AxisTitles(drawBelowEverything: false),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(fontSize: 11);
    String text = switch (value.toInt()) {
      0 => 'Jan',
      1 => 'Feb',
      2 => 'Mar',
      3 => 'Apr',
      4 => 'May',
      5 => 'Jun',
      6 => 'Jul',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: true,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: const EdgeInsets.only(left: -20.0),
      getTooltipItem:
          (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(color: Colors.black, fontSize: 11),
            );
          },
    ),
  );

  List<BarChartGroupData> get barGroups => List.generate(7, (index) {
    return BarChartGroupData(
      x: index,
      showingTooltipIndicators: [0],
      barRods: [
        BarChartRodData(
          toY: _random.nextInt(21).toInt() + 1,
          color: index % 2 == 0 ? Color(0xffFF8F6B) : Color(0xff5B93FF),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
      ],
    );
  });
}
