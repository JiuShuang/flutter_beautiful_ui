import 'package:flutter/material.dart';

class MoonlightPainter extends CustomPainter {
  final Color color;

  MoonlightPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width*0.8, size.height / 2),
        width: size.width/2,
        height: size.width/2,
      ),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
