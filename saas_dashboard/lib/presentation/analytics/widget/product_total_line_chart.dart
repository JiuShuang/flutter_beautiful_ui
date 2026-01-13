import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class ProductTotalLineChart extends StatefulWidget {
  final double width;
  final double height;
  const ProductTotalLineChart({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<ProductTotalLineChart> createState() =>
      _ProductTotalLineChartState();
}

class _ProductTotalLineChartState extends State<ProductTotalLineChart> {
  LineChartData totalProductData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      minX: 1,
      maxX: 8,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
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
          color: Color(0xff5B93FF),
          isStrokeCapRound: true,
          barWidth: 3,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [Color(0xffE3EDFF), Color(0xffE3EDFF).withAlpha(50)],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData totalSalesData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      minX: 1,
      maxX: 8,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 60),
            FlSpot(2, 45),
            FlSpot(3, 95),
            FlSpot(4, 30),
            FlSpot(5, 70),
            FlSpot(6, 15),
            FlSpot(7, 88),
            FlSpot(8, 90),
          ],
          isCurved: true,
          color: Color(0xffFFD66B),
          isStrokeCapRound: true,
          barWidth: 3,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [Color(0xffFFFAEE), Color(0xffFFFAEE).withAlpha(50)],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: widget.width * 0.31,
          height: widget.height * 0.2,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(AppConstrain.paddingSmall),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(AppConstrain.paddingSmall),
                      decoration: BoxDecoration(
                        color: Color(0xffF7FAFF),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.images.box),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstrain.paddingSmall,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Product",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "5,00,874",
                              style: TextTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "+1400 New Added",
                      style: TextStyle(fontSize: 8, color: Color(0xff2B9943)),
                    ),
                  ],
                ),
              ),
              Expanded(child: LineChart(totalProductData())),
            ],
          ),
        ),
        Container(
          width: widget.width * 0.31,
          height: widget.height * 0.2,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(AppConstrain.paddingSmall),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(AppConstrain.paddingSmall),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFBF0),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(Assets.images.cart),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstrain.paddingSmall,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Saless",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "2,34,888",
                              style: TextTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "+1000 New Added",
                      style: TextStyle(fontSize: 8, color: Color(0xff2B9943)),
                    ),
                  ],
                ),
              ),
              Expanded(child: LineChart(totalSalesData())),
            ],
          ),
        ),
      ],
    );
  }
}
