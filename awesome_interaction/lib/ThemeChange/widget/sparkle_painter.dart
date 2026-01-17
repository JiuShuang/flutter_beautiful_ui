import 'package:flutter/material.dart';

class SparklePainter extends CustomPainter {
  final Color color;

  SparklePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();
    final Radius radius = Radius.circular(size.width / 2);
    path.moveTo(0, size.height / 2);
    path.arcToPoint(
      Offset(size.width / 2, 0),
      radius: radius,
      clockwise: false,
    );
    path.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: radius,
      clockwise: false,
    );
    path.arcToPoint(
      Offset(size.width / 2, size.height),
      radius: radius,
      clockwise: false,
    );
    path.arcToPoint(
      Offset(0, size.height / 2),
      radius: radius,
      clockwise: false,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
