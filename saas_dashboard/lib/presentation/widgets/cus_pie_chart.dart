import 'dart:math' as math;

import 'package:flutter/material.dart';

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

class CusPieChartPaint extends CustomPainter {
  final List<PieData> pieDataList;
  final Offset center;
  final double centerSPaceRadius;
  final double strokeWidth;
  final String? title;
  final String? subtitle;

  CusPieChartPaint({
    super.repaint,
    required this.pieDataList,
    required this.centerSPaceRadius,
    required this.strokeWidth,
    this.title,
    this.subtitle,
    required this.center,
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
        center: center,
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
    if(title==null && subtitle==null) return;
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
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
