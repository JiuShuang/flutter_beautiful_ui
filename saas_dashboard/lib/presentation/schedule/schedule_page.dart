import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_board_view.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_list_view.dart';
import 'package:saas_dashboard/presentation/schedule/component/schedule_timeline_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final Map<String, Widget> _views = {
    "List": ScheduleListView(),
    "Board": ScheduleBoardView(),
    "Timeline": ScheduleTimelineView(),
  };
  String _activeView = "List";

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
                Text("Task Preview", style: TextTheme.of(context).titleMedium),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 15),
                      Text("Add Task", style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: _views.keys.map((value) {
                    late BorderRadius borderRadius;
                    if (value == "List") {
                      borderRadius = BorderRadius.only(
                        topLeft: Radius.circular(AppConstrain.borderRadius / 2),
                        bottomLeft: Radius.circular(
                          AppConstrain.borderRadius / 2,
                        ),
                      );
                    } else if (value == "Timeline") {
                      borderRadius = BorderRadius.only(
                        topRight: Radius.circular(
                          AppConstrain.borderRadius / 2,
                        ),
                        bottomRight: Radius.circular(
                          AppConstrain.borderRadius / 2,
                        ),
                      );
                    } else {
                      borderRadius = BorderRadius.zero;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _activeView = value;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConstrain.paddingSmall / 2,
                          horizontal: AppConstrain.paddingMedium,
                        ),
                        decoration: BoxDecoration(
                          color: _activeView == value
                              ? AppColors.secondColor
                              : AppColors.primaryColor,
                          borderRadius: borderRadius,
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 12,
                            color: _activeView == value
                                ? AppColors.primaryColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: width * 0.2,
                  child: TextField(
                    style: TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 11),
                      fillColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingSmall),
            Expanded(child: _views[_activeView] ?? SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
