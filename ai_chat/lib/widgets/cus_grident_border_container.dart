import 'dart:math';
import 'dart:ui';
import 'package:ai_chat/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CusGridentBorderContainer extends StatelessWidget {
  final double? width; // + 可选宽
  final double? height; // + 可选高
  final double? radius;
  final double? borderWidth; // + 可选边框宽度
  final Color? backgroundColor;
  final Widget? child;

  const CusGridentBorderContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius,
    this.borderWidth,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Widget stack = Stack(
      clipBehavior: Clip.antiAlias, // + 防止圆角溢出
      children: [
        // // 第一层：磨砂填充
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 1000),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                color: AppColor.containerColor,
              ),
            ),
          ),
        ),
        // 第二层：边框
        Positioned.fill(
          child: CustomPaint(
            painter: GlassBorderPainter(
              radius: radius, // + 传参数
              borderWidth: borderWidth, // + 传参数
            ),
          ),
        ),
        // 第三层：内容（不用 Positioned.fill！让 child 决定 Stack 尺寸）
        if (child != null) child!,
      ],
    );

    // 只有当显式指定了 width 或 height 时才用 SizedBox 约束
    if (width != null || height != null) {
      return SizedBox(width: width, height: height, child: stack);
    }
    return stack;
  }
}

class GlassBorderPainter extends CustomPainter {
  final double? radius;
  final double? borderWidth;

  GlassBorderPainter({this.radius, this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final r = radius ?? size.height / 2;
    final sw = borderWidth ?? 1.25;
    final w = size.width;
    final h = size.height;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..color = Colors.white
      ..isAntiAlias = true;

    paint.shader = ui.Gradient.linear(
      Offset(0, h),
      Offset.zero,
      [Colors.transparent, Colors.white],
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(r, r), radius: r - sw),
      _degToRad(180),
      _degToRad(90),
      false,
      paint,
    );

    canvas.drawLine(
      Offset(sw, h - r),
      Offset(sw, r),
      paint,
    );

    paint.shader = ui.Gradient.linear(
      Offset(w - r, h),
      Offset(w - 1.5 * r, h),
      [
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.9),
      ],
    );
    canvas.drawLine(
      Offset(r, sw),
      Offset(w - r, sw),
      paint,
    );

    paint.shader = ui.Gradient.linear(
      Offset(w - r, 0),
      Offset(w - r, h),
      [Colors.transparent, Colors.white],
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(w - r, h - r), radius: r - sw),
      _degToRad(0),
      _degToRad(90),
      false,
      paint,
    );

    canvas.drawLine(
      Offset(w - sw, r),
      Offset(w - sw, h - r),
      paint,
    );

    paint.shader = ui.Gradient.linear(
      Offset(r, w),
      Offset(1.5 * r, h),
      [
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.9),
      ],
    );

    canvas.drawLine(
      Offset(w - r, h - sw),
      Offset(r, h - sw),
      paint,
    );

  }

  double _degToRad(double deg) => deg * pi / 180;

  @override
  bool shouldRepaint(covariant GlassBorderPainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.borderWidth != borderWidth;
  }
}
