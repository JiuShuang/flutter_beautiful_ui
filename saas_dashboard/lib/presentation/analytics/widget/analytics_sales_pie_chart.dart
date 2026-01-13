import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/widgets/cus_pie_chart.dart';

class AnalyticsSalesPieChart extends StatefulWidget {
  final double width;
  final double height;
  const AnalyticsSalesPieChart({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<AnalyticsSalesPieChart> createState() => _AnalyticsSalesPieChartState();
}

class _AnalyticsSalesPieChartState extends State<AnalyticsSalesPieChart> {
  final List<PieData> _pieDataList = [
    PieData(color: Color(0xffF7FAFF), value: 20),
    PieData(color: Color(0xffFF8F6B), value: 25),
    PieData(color: Color(0xffFFD66B), value: 30),
    PieData(color: Color(0xff5B93FF), value: 40),
  ];

  final List<PieIndictor> _pieIndictorList = [
    PieIndictor(color: Color(0xff5B93FF), label: "Total Sales"),
    PieIndictor(color: Color(0xffFFD66B), label: "Total Order"),
    PieIndictor(color: Color(0xffFF8F6B), label: "Order Cancel"),
  ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Sales Analytics",
                style: TextTheme.of(context).bodyMedium,
              ),
              Icon(
                Icons.more_horiz_outlined,
                size: 15,
                color: Color(0xffB3B3BF),
              ),
            ],
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  painter: CusPieChartPaint(
                    center: Offset(
                      constraints.maxWidth / 2,
                      constraints.maxHeight / 2,
                    ),
                    strokeWidth: 10,
                    centerSPaceRadius: widget.height * 0.12,
                    pieDataList: _pieDataList,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _pieIndictorList.map((value) {
              return Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    margin: EdgeInsets.only(
                      right: AppConstrain.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      color: value.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(value.label, style: TextStyle(fontSize: 10)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
