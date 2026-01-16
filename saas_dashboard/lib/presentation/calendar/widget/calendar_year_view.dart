import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/widgets/cus_calendar.dart';

class CalendarYearView extends StatefulWidget {
  final DateTime dateTime;
  const CalendarYearView({super.key, required this.dateTime});

  @override
  State<CalendarYearView> createState() => _CalendarYearViewState();
}

class _CalendarYearViewState extends State<CalendarYearView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.1,
            crossAxisSpacing: AppConstrain.paddingSmall,
            mainAxisSpacing: AppConstrain.paddingSmall,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final DateTime month = DateTime(widget.dateTime.year, index + 1);
            return CusCalendar(
              dateTime: month,
              showStep: false,
              showSelected: false,
            );
          },
        ),
      ),
    );
  }
}
