import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_calendar.dart';

class CalendarCreateSchedule extends StatefulWidget {
  final double width;
  const CalendarCreateSchedule({super.key, required this.width});

  @override
  State<CalendarCreateSchedule> createState() => _CalendarCreateScheduleState();
}

class _CalendarCreateScheduleState extends State<CalendarCreateSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.24,
      padding: EdgeInsets.all(AppConstrain.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.add, size: 17),
                Text("Create Schedule", style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          SizedBox(height: AppConstrain.paddingSmall),
          CusCalendar(dateTime: DateTime.now()),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConstrain.paddingSmall / 2,
            ),
            child: Text("People", style: TextTheme.of(context).bodyMedium),
          ),
          TextField(
            style: TextStyle(fontSize: 11),
            decoration: InputDecoration(
              hintText: "Search for People",
              hintStyle: TextStyle(fontSize: 11),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstrain.paddingSmall,
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(AppConstrain.paddingSmall),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xffF2F2F4)),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Assets.images.avatar.path,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: AppConstrain.paddingSmall),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alexey Stave",
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  "laboanovskiy@gmail.com",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Color(0xff818094),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(widget.width, 40),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.secondColor),
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
              ),
            ),
            onPressed: () {},
            child: Text(
              "My Schedule",
              style: TextStyle(fontSize: 11, color: AppColors.secondColor),
            ),
          ),
        ],
      ),
    );
  }
}
