import 'dart:math' as math;

import 'package:awesome_interaction/ThemeChange/theme_color.dart';
import 'package:awesome_interaction/ThemeChange/widget/moon_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/moonlight_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/sparkle_painter.dart';
import 'package:flutter/material.dart';

class DarkMoon extends StatefulWidget {
  final Animation animation;
  const DarkMoon({super.key, required this.animation});

  @override
  State<DarkMoon> createState() => _DarkMoonState();
}

class _DarkMoonState extends State<DarkMoon> {
  final List<Offset> sparkleOffsets = [
    Offset(15, 50),
    Offset(35, 29),
    Offset(60, 33),
    Offset(85, 32),
    Offset(105, 55),
    Offset(120, 25),
    Offset(128, 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...List.generate(ThemeColor.moonlightColor.length, (index) {
          return Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -100.0 * widget.animation.value),
                  child: Opacity(
                    opacity: 1.0 - widget.animation.value,
                    child: child,
                  ),
                );
              },
              child: Center(
                child: CustomPaint(
                  size: Size.square(420 - index * 65),
                  painter: MoonlightPainter(
                    color: ThemeColor.moonlightColor[index],
                  ),
                ),
              ),
            ),
          );
        }),
        ...sparkleOffsets.map((offset) {
          return Positioned(
            left: offset.dx,
            top: offset.dy,
            child: AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -100.0 * widget.animation.value),
                  child: child,
                );
              },
              child: CustomPaint(
                size: Size(15, 15),
                painter: SparklePainter(color: ThemeColor.sparkleColor),
              ),
            ),
          );
        }),
        Positioned(
          top: 0,
          bottom: 0,
          right: 10,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-100.0 * widget.animation.value, 0),
                child: Transform.rotate(
                  angle: -math.pi * widget.animation.value,
                  child: Opacity(
                    opacity: 1.0 - widget.animation.value,
                    child: child,
                  ),
                ),
              );
            },
            child: Center(
              child: CustomPaint(
                size: Size(80, 80),
                painter: MoonPainter(
                  moonMainColor: ThemeColor.moonColor,
                  craterColor: ThemeColor.craterColor,
                  moonShadowColor: ThemeColor.moonShadowColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
