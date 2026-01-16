import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class CusCalendar extends StatefulWidget {
  final DateTime dateTime;
  final bool showStep;
  final bool showSelected;
  const CusCalendar({
    super.key,
    required this.dateTime,
    this.showStep = true,
    this.showSelected = true,
  });

  @override
  State<CusCalendar> createState() => _CusCalendarState();
}

class _CusCalendarState extends State<CusCalendar> {
  final List<String> _calendarTitle = ['S', 'S', 'M', 'T', 'W', 'T', 'F'];
  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  late DateTime _selectedTime;
  late int _dayOffset;
  late int _daysInMonth;
  late int _preDaysInMonth;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstrain.paddingSmall * 0.5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFAFAFB)),
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_months[widget.dateTime.month - 1]} ${widget.dateTime.month},${widget.dateTime.year}",
                style: TextStyle(fontSize: 10),
              ),
              if (widget.showStep)
                Row(
                  children: [
                    Transform.rotate(
                      angle: math.pi / 2,
                      child: SvgPicture.asset(
                        Assets.images.arrow,
                        colorFilter: ColorFilter.mode(
                          Color(0xffCDCCD4),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: AppConstrain.paddingSmall / 2),
                    Transform.rotate(
                      angle: math.pi * 3 / 2,
                      child: SvgPicture.asset(
                        Assets.images.arrow,
                        colorFilter: ColorFilter.mode(
                          Color(0xffCDCCD4),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: _dayOffset + _daysInMonth + 7,
            itemBuilder: (context, index) {
              if (index < 7) {
                return Center(
                  child: Text(
                    _calendarTitle[index],
                    style: TextStyle(fontSize: 10),
                  ),
                );
              }
              if (index - 7 < _dayOffset) {
                int preMonthDay = _preDaysInMonth - _dayOffset + index - 7;
                return Center(
                  child: Text(
                    preMonthDay.toString(),
                    style: TextStyle(fontSize: 10, color: Color(0xff818094)),
                  ),
                );
              }
              int day = index - _dayOffset - 7 + 1;
              bool isSelectedDay = _selectedTime.day == day;
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
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    color: isSelectedDay && widget.showSelected
                        ? AppColors.secondColor
                        : null,
                    shape: BoxShape.circle,
                    boxShadow: [
                      if (isSelectedDay && widget.showSelected)
                        BoxShadow(
                          color: AppColors.secondColor.withAlpha(120),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelectedDay && widget.showSelected
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
