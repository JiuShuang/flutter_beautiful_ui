import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/calendar/calendar.dart';

class CalendarMonthView extends StatefulWidget {
  final DateTime dateTime;
  const CalendarMonthView({super.key, required this.dateTime});

  @override
  State<CalendarMonthView> createState() => _CalendarMonthViewState();
}

class _CalendarMonthViewState extends State<CalendarMonthView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<String> _calendarTitle = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];
  late DateTime _selectedTime;
  late int _dayOffset;
  late int _daysInMonth;
  late int _preDaysInMonth;
  late List<Calendar> _monthCalendar;

  @override
  void initState() {
    _selectedTime = widget.dateTime;
    _dayOffset =
        (DateTime(widget.dateTime.year, widget.dateTime.month, 1).weekday + 1) %
        7;
    _daysInMonth = DateTime(
      widget.dateTime.year,
      widget.dateTime.month + 1,
      0,
    ).day;
    _preDaysInMonth = DateTime(
      widget.dateTime.year,
      widget.dateTime.month,
      0,
    ).day;
    _monthCalendar = calendarList.where((calendar) {
      return calendar.time.month == widget.dateTime.month;
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
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1,
        ),
        itemCount: _dayOffset + _daysInMonth + 7,
        itemBuilder: (context, index) {
          if (index < 7) {
            return Center(
              child: Text(
                _calendarTitle[index],
                style: TextTheme.of(context).bodySmall,
              ),
            );
          }
          if (index - 7 < _dayOffset) {
            int preDays = _preDaysInMonth - _dayOffset + index - 7;
            return Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border(
                  left: index % 7 == 0
                      ? BorderSide(color: Color(0xffEEEEF0))
                      : BorderSide.none,
                  top: index - 7 < 7
                      ? BorderSide(color: Color(0xffEEEEF0))
                      : BorderSide.none,
                  bottom: BorderSide(color: Color(0xffEEEEF0)),
                  right: BorderSide(color: Color(0xffEEEEF0)),
                ),
              ),
              child: Center(
                child: Text(
                  preDays.toString(),
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(color: Color(0xffB3B3BF)),
                ),
              ),
            );
          }
          int day = index - _dayOffset - 7 + 1;
          List<Calendar> dayCalendar = _monthCalendar
              .where((value) {
                return value.time.day == day;
              })
              .take(2)
              .toList();
          bool isSelectedDay = day == _selectedTime.day;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTime = DateTime(
                  widget.dateTime.year,
                  widget.dateTime.month,
                  day,
                );
              });
            },
            child: Container(
              padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border(
                  left: index % 7 == 0
                      ? BorderSide(color: Color(0xffEEEEF0))
                      : BorderSide.none,
                  top: index - 7 < 7
                      ? BorderSide(color: Color(0xffEEEEF0))
                      : BorderSide.none,
                  bottom: BorderSide(color: Color(0xffEEEEF0)),
                  right: BorderSide(color: Color(0xffEEEEF0)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                    decoration: BoxDecoration(
                      color: isSelectedDay
                          ? Color(0xffFF8F6B)
                          : AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      day.toString(),
                      style: TextStyle(
                        color: isSelectedDay
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                  ...List.generate(dayCalendar.length, (index) {
                    final Calendar calendar = dayCalendar[index];
                    final Animation animation = CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        1 / dayCalendar.length * index,
                        1 / dayCalendar.length * (1 + index),
                      ),
                    );
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 10.0 * (1 - animation.value)),
                          child: Opacity(
                            opacity: animation.value,
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          AppConstrain.paddingSmall * 0.3,
                        ),
                        margin: EdgeInsets.only(
                          bottom: AppConstrain.paddingSmall / 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                          color: calendar.lerver.backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            calendar.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: calendar.lerver.textColor,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
