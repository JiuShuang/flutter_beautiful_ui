import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_checkbox.dart';

class TaskBoardLine extends StatelessWidget {
  final double width;
  final String title;
  final List<Task> taskList;

  const TaskBoardLine({
    super.key,
    required this.title,
    required this.taskList,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextTheme.of(context).bodyMedium),
        SizedBox(height: AppConstrain.paddingMedium),
        ...taskList.map((task) {
          return Container(
            width: width - AppConstrain.paddingMedium,
            padding: EdgeInsets.all(AppConstrain.paddingSmall),
            margin: EdgeInsets.only(bottom: AppConstrain.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CusCheckbox(
                      value: false,
                      onChanged: (value) {},
                      radius: 100,
                    ),
                    SizedBox(width: AppConstrain.paddingSmall),
                    Expanded(
                      child: Text(
                        task.name,
                        style: TextTheme.of(context).bodySmall,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz_outlined,
                      size: 15,
                      color: Color(0xffB3B3BF),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  padding: EdgeInsets.all(AppConstrain.paddingSmall * 0.3),
                  margin: EdgeInsets.symmetric(
                    vertical: AppConstrain.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: task.lever.backgroundColor,
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      task.lever.label,
                      style: TextStyle(
                        fontSize: 11,
                        color: task.lever.textColor,
                      ),
                    ),
                  ),
                ),
                Text(task.detail, style: TextStyle(fontSize: 10)),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(
                    AppConstrain.borderRadius,
                  ),
                  child: Image.asset(task.image),
                ),
                SizedBox(height: AppConstrain.paddingMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Assets.images.avatar.path,
                              width: 20,
                            ),
                          ),
                          ...List.generate(task.member - 1, (index) {
                            return Positioned(
                              left: (index + 1) * 12.0,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  Assets.images.avatar.path,
                                  width: 20,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.chat_rounded,
                          size: 15,
                          color: Color(0xffB3B3BF),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall / 2),
                        Text(
                          task.commentNum.toString(),
                          style: TextStyle(fontSize: 8),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall / 2),
                        Icon(
                          Icons.heart_broken,
                          size: 15,
                          color: Color(0xffB3B3BF),
                        ),
                        SizedBox(width: AppConstrain.paddingSmall / 2),
                        Text(
                          task.likeNum.toString(),
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
