import 'package:flutter/material.dart';

class Calendar {
  final String title;
  final DateTime time;
  final CalendarLever lerver;

  Calendar({
    required this.title,
    required this.time,
    required this.lerver,
  });
}

enum CalendarLever {
  low("Low", Color(0xff26C0E2), Colors.white),
  media("Media", Color(0xffEF37FF), Colors.white),
  high("High", Color(0xffFF8F6B), Colors.white);

  final String label;
  final Color backgroundColor;
  final Color textColor;

  const CalendarLever(this.label, this.backgroundColor, this.textColor);
}
