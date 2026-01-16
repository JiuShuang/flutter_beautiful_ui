import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/calendar/component/calendar_area.dart';
import 'package:saas_dashboard/presentation/calendar/component/calendar_create_schedule.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _leftAnimation;
  late final Animation _rightAnimation;
  final List<String> _calendarView = ["Day", "Month", "Year"];

  String _actoveView = "Month";

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _leftAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _rightAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Calendar", style: TextTheme.of(context).titleMedium),
                Row(
                  children: _calendarView.map((type) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstrain.paddingSmall / 2,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _actoveView == type
                              ? null
                              : Color(0xffF2F2FB),
                        ),
                        onPressed: () {
                          setState(() {
                            _actoveView = type;
                          });
                        },
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 11,
                            color: _actoveView == type
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingSmall),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedBuilder(
                    animation: _leftAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-20.0 * (1 - _leftAnimation.value), 0),
                        child: Opacity(
                          opacity: _leftAnimation.value,
                          child: child,
                        ),
                      );
                    },
                    child: CalendarCreateSchedule(width: width),
                  ),
                  AnimatedBuilder(
                    animation: _rightAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(20.0 * (1 - _rightAnimation.value), 0),
                        child: Opacity(
                          opacity: _rightAnimation.value,
                          child: child,
                        ),
                      );
                    },
                    child: CalendarArea(
                      width: width,
                      activeView: _actoveView,
                      dateTime: DateTime.now(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
