import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/calendar/calendar.dart';
import 'package:saas_dashboard/presentation/widgets/cus_timeline.dart';

class CalendarDayView extends StatefulWidget {
  final DateTime dateTime;
  const CalendarDayView({super.key, required this.dateTime});

  @override
  State<CalendarDayView> createState() => _CalendarDayViewState();
}

class _CalendarDayViewState extends State<CalendarDayView>
    with SingleTickerProviderStateMixin {
  late final List<Calendar> _dayCalendarList;
  late AnimationController _controller;

  @override
  void initState() {
    _dayCalendarList = calendarList.where((calendar) {
      return calendar.time.difference(widget.dateTime).inDays == 0;
    }).toList();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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
    return Container(
      margin: EdgeInsets.only(top: AppConstrain.paddingSmall),
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CusTimeline(),
              ...List.generate(_dayCalendarList.length, (index) {
                final Calendar calendar = _dayCalendarList[index];
                int hourDifference = calendar.time
                    .difference(
                      DateTime(
                        widget.dateTime.year,
                        widget.dateTime.month,
                        widget.dateTime.day,
                      ),
                    )
                    .inHours;
                final double topOffset = hourDifference * 50 - 10;
                final Animation animation = CurvedAnimation(
                  curve: Interval(
                    1 / _dayCalendarList.length * index,
                    1 / _dayCalendarList.length * (1 + index),
                  ),
                  parent: _controller,
                );
                return Positioned(
                  left: AppConstrain.paddingLarge * 3,
                  top: topOffset,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20.0 * (1 - animation.value)),
                        child: Opacity(opacity: animation.value, child: child),
                      );
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                      decoration: BoxDecoration(
                        color: calendar.lerver.backgroundColor,
                        borderRadius: BorderRadius.circular(
                          AppConstrain.borderRadius,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          calendar.title,
                          style: TextStyle(
                            color: calendar.lerver.textColor,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
