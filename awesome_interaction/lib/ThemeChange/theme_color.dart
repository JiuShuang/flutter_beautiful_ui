import 'package:flutter/material.dart';

class ThemeColor {
  static final Color darkBackground = Colors.black;
  static final Color darkButtonBackgroundColor = Color(0xff1d1f2c);
  static final List<BoxShadow> darkButtonShadow = [
    BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 15),
  ];
  static final Color sparkleColor = Colors.white;
  static final Color moonColor = Color(0xffc4c9d1);
  static final Color craterColor = Color(0xff959db1);
  static final LinearGradient moonShadowColor = LinearGradient(
    colors: [Color(0xffeceee4), Color(0xff9f9f9e)],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  );
  static final List<Color> moonlightColor = [
    Color(0xff393b46),
    Color(0xff51535b),
    Color(0xff65676e),
  ];

  static final Color lightBackground = Color(0xff3d7eae);
  static final Color sunColor = Color(0xffecca2e);
  static final LinearGradient sunShadowColor = LinearGradient(
    colors: [Color(0xfff6e9a6), Color(0xffa68b2b)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final List<Color> cloudColor = [Color(0xffa3c2d6), Color(0xfff3fdff)];
  static final List<Color> sunlightColor = [
    Color(0xff548cb6),
    Color(0xff6799bd),
    Color(0xff78a4c5),
  ];
}
