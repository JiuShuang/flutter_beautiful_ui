import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/calendar/widget/calendar_day_view.dart';
import 'package:saas_dashboard/presentation/calendar/widget/calendar_month_view.dart';
import 'package:saas_dashboard/presentation/calendar/widget/calendar_year_view.dart';

class CalendarArea extends StatefulWidget {
  final double width;
  final String activeView;
  final DateTime dateTime;
  const CalendarArea({
    super.key,
    required this.width,
    required this.activeView,
    required this.dateTime,
  });

  @override
  State<CalendarArea> createState() => _CalendarAreaState();
}

class _CalendarAreaState extends State<CalendarArea> {
  late Map<String, Widget> _calendarView;

  @override
  void initState() {
    _calendarView = {
      "Month": CalendarMonthView(dateTime: widget.dateTime),
      "Day": CalendarDayView(dateTime: widget.dateTime),
      "Year": CalendarYearView(dateTime: widget.dateTime,),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        children: [
          if (widget.activeView != "Year")
            Container(
              padding: EdgeInsets.all(AppConstrain.paddingSmall),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "December 2,2021",
                    style: TextTheme.of(context).bodySmall,
                  ),
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
            ),
          Expanded(
            child: _calendarView[widget.activeView] ?? SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
