import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/presentation/widgets/cus_checkbox.dart';
import 'package:saas_dashboard/presentation/widgets/cus_table_title.dart';

class TaskListCard extends StatelessWidget {
  final List<Task> taskList;
  final String title;
  const TaskListCard({super.key, required this.taskList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstrain.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextTheme.of(context).bodyMedium),
              Text(
                "See More",
                style: TextStyle(fontSize: 11, color: AppColors.secondColor),
              ),
            ],
          ),
          SizedBox(height: AppConstrain.paddingSmall),
          Row(
            children: [
              Expanded(
                child: CusTableTitle(text: "Check Box", showArrow: false),
              ),
              Expanded(child: CusTableTitle(text: "TaskName")),
              Expanded(child: CusTableTitle(text: "Start Date")),
              Expanded(child: CusTableTitle(text: "End Date")),
              Expanded(child: CusTableTitle(text: "Member")),
              Expanded(child: CusTableTitle(text: "Status")),
              Expanded(child: CusTableTitle(text: "Actions", showArrow: false)),
            ],
          ),
          ...List.generate(taskList.length, (index) {
            final Task task = taskList[index];
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: AppConstrain.paddingSmall / 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: CusCheckbox(value: false, onChanged: (value) {}),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: task.iconBackgroundColor,
                          ),
                          child: Image.asset(task.icon, width: 18),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall),
                        Text(
                          task.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.secondColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      task.startDate,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      task.endDate,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xffDF5F6A),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${task.member} Member",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Container(
                        width: 80,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: task.status.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            AppConstrain.borderRadius / 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            task.status.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: task.status.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            AppConstrain.paddingSmall / 2,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEFEFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit_rounded,
                            color: Color(0xff605BFF),
                            size: 15,
                          ),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall),
                        Container(
                          padding: EdgeInsets.all(
                            AppConstrain.paddingSmall / 2,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFEF4F5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete_rounded,
                            color: Color(0xffE71D36),
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          Divider(color: Color(0xffF2F2F4))
        ],
      ),
    );
  }
}
