import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';

class DashboardAnalytics extends StatefulWidget {
  final double width;
  final double height;
  const DashboardAnalytics({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<DashboardAnalytics> createState() => _DashboardAnalyticsState();
}

class _DashboardAnalyticsState extends State<DashboardAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.38,
      height: widget.height * 0.4,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Analytics", style: TextTheme.of(context).bodyMedium),
              Icon(
                Icons.more_horiz_outlined,
                size: 15,
                color: Color(0xffB3B3BF),
              ),
            ],
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 60,
                sections: showingSections(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final radius = 13.0;
      return switch (i) {
        0 => PieChartSectionData(
          color: Color(0xffFF8F6B),
          value: 40,
          title: '',
          radius: radius,
        ),
        1 => PieChartSectionData(
          color: Color(0xffFFD66B),
          value: 30,
          title: '',
          radius: radius,
        ),
        2 => PieChartSectionData(
          color: Color(0xff5B93FF),
          value: 15,
          title: '',
          radius: radius,
        ),
        3 => PieChartSectionData(
          color: Color(0xffF7FAFF),
          value: 15,
          title: '',
          radius: radius,
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }
}
