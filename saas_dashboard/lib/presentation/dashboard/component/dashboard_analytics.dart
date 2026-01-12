import 'dart:math' as math;
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
  final List<PieData> _pieDataList = [
    PieData(color: Color(0xffF7FAFF), value: 20),
    PieData(color: Color(0xffFF8F6B), value: 25),
    PieData(color: Color(0xffFFD66B), value: 30),
    PieData(color: Color(0xff5B93FF), value: 40),
  ];

  final List<PieIndictor> _pieIndictorList = [
    PieIndictor(color: Color(0xff5B93FF), label: "Sale"),
    PieIndictor(color: Color(0xffFFD66B), label: "Distribute"),
    PieIndictor(color: Color(0xffFF8F6B), label: "Return"),
  ];

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
            child: CustomPaint(
              painter: PieChartPaint(
                strokeWidth: 10,
                centerSPaceRadius: widget.height * 0.12,
                pieDataList: _pieDataList,
                title: '80%',
                subtitle: 'Transactions',
              ),
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(value.label, style: TextTheme.of(context).bodySmall),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PieIndictor {
  final Color color;
  final String label;

  PieIndictor({required this.color, required this.label});
}

class PieData {
  final Color color;
  final int value;

  PieData({required this.color, required this.value});
}

class PieChartPaint extends CustomPainter {
  final List<PieData> pieDataList;
  final double centerSPaceRadius;
  final double strokeWidth;
  final String title;
  final String subtitle;

  PieChartPaint({
    super.repaint,
    required this.pieDataList,
    required this.centerSPaceRadius,
    required this.strokeWidth,
    required this.title,
    required this.subtitle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final totalValue = pieDataList.fold<int>(
      0,
      (sum, data) => sum + data.value,
    );
    double startAngle = -0.5 * math.pi;
    for (var i = 0; i < pieDataList.length; i++) {
      PieData data = pieDataList[i];
      final rect = Rect.fromCircle(
        center: Offset(0, size.height / 2),
        radius: centerSPaceRadius - i * 2,
      );
      final double fraction = data.value / totalValue;
      final double sweepAngle = -(fraction * 2 * math.pi);
      final Paint paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth + i * 5
        ..color = data.color;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        children: [
          TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            text: "$title\n",
          ),
          TextSpan(
            style: TextStyle(color: Color(0xff4F4E69), fontSize: 10),
            text: subtitle,
          ),
        ],
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final textOffset = Offset(
      -textPainter.width / 2,
      size.height / 2 - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
