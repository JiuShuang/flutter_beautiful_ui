import 'package:awesome_interaction/ThemeChange/component/dark_moon.dart';
import 'package:awesome_interaction/ThemeChange/theme_color.dart';
import 'package:awesome_interaction/ThemeChange/widget/moon_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/moonlight_painter.dart';
import 'package:awesome_interaction/ThemeChange/widget/sparkle_painter.dart';
import 'package:flutter/material.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({super.key});

  @override
  State<ThemeChange> createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _darkAnimation;
  bool _isDark = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _darkAnimation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(color: _isDark ? Colors.black : Colors.white),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isDark = !_isDark;
            });
            if (_isDark) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            width: 240,
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: _isDark
                  ? ThemeColor.darkBackground
                  : ThemeColor.lightBackground,
              boxShadow: ThemeColor.darkButtonShadow,
              borderRadius: BorderRadius.circular(100),
            ),
            child: DarkMoon(animation: _darkAnimation),
          ),
        ),
      ),
    );
  }
}
