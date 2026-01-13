import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';

class DashboardReports extends StatefulWidget {
  final double width;
  final double height;
  const DashboardReports({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<DashboardReports> createState() => _DashboardReportsState();
}

class _DashboardReportsState extends State<DashboardReports> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.6,
      height: widget.height * 0.4,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Reports", style: TextTheme.of(context).bodyMedium),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(mainData()),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: value % 20 == 0 ? Color(0xff848396) : Colors.transparent,
            strokeWidth: 0.1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            getTitlesWidget: leftTimeTitleWidgets,
            reservedSize: 23,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 10),
            FlSpot(1, 85),
            FlSpot(2, 45),
            FlSpot(3, 95),
            FlSpot(4, 30),
            FlSpot(5, 70),
            FlSpot(6, 15),
            FlSpot(7, 88),
            FlSpot(8, 55),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [Color(0xff80C6FC), Color(0xff9E99F8), Color(0xffE46EF2)],
          ),
          isStrokeCapRound: true,
          barWidth: 3,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [Color(0xffF9FDFF), Color(0xffFFF9FE)],
            ),
          ),
        ),
      ],
    );
  }

  Widget leftTimeTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 8, color: Color(0xff848396));
    return SideTitleWidget(
      meta: meta,
      child: Text(
        value.toInt().toString(),
        style: style,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 8, color: Color(0xff848396));
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('10am', style: style);
        break;
      case 1:
        text = const Text('11am', style: style);
        break;
      case 2:
        text = const Text('12pm', style: style);
        break;
      case 3:
        text = const Text('01am', style: style);
        break;
      case 4:
        text = const Text('02am', style: style);
        break;
      case 5:
        text = const Text('03am', style: style);
        break;
      case 6:
        text = const Text('04am', style: style);
        break;
      case 7:
        text = const Text('05am', style: style);
        break;
      case 8:
        text = const Text('06am', style: style);
        break;
      case 9:
        text = const Text('07am', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(meta: meta, child: text);
  }
}
