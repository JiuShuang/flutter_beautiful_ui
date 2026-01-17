import 'package:flutter/material.dart';

class MoonPainter extends CustomPainter {
  final Color moonMainColor;
  final Color craterColor;
  final LinearGradient moonShadowColor;

  MoonPainter({
    super.repaint,
    required this.moonMainColor,
    required this.craterColor,
    required this.moonShadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint moonPaint = Paint()
      ..color = moonMainColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1);
    final Paint moonLightPaint = Paint()
      ..shader = moonShadowColor.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    final Path moonLightPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(width / 2 - 2, height / 2),
          radius: width / 2 + 1,
        ),
      );
    final Path moonPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(width / 2, height / 2),
          radius: width / 2,
        ),
      );
    canvas.drawPath(moonLightPath, moonLightPaint);
    canvas.drawPath(moonPath, moonPaint);
    _drawCrater(Offset(width * 0.3, height * 0.575), width * 0.5 * 0.4, canvas);
    _drawCrater(Offset(width * 0.5, height * 0.28), width * 0.5 * 0.2, canvas);
    _drawCrater(
      Offset(width * 0.75, height * 0.55),
      width * 0.5 * 0.25,
      canvas,
    );
  }

  void _drawCrater(Offset center, double radius, Canvas canvas) {
    final Path craterPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    final Paint craterPaint = Paint()
      ..color = craterColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(craterPath, craterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
