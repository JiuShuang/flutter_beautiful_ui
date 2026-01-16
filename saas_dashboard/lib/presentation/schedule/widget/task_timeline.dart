import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/widgets/cus_checkbox.dart';
import 'package:saas_dashboard/presentation/widgets/cus_timeline.dart';

class TaskTimeline extends StatefulWidget {
  final double width;
  final double height;
  final List<Task> taskList;
  const TaskTimeline({
    super.key,
    required this.width,
    required this.height,
    required this.taskList,
  });

  @override
  State<TaskTimeline> createState() => _TaskTimelineState();
}

class _TaskTimelineState extends State<TaskTimeline>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _activeDate = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TaskTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.taskList != oldWidget.taskList) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.78,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: AppConstrain.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstrain.paddingLarge,
            ),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeDate = index;
                    });
                  },
                  child: Container(
                    width: 30,
                    padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                    decoration: BoxDecoration(
                      color: _activeDate == index
                          ? AppColors.secondColor
                          : AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          color: _activeDate == index
                              ? AppColors.primaryColor
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: AppConstrain.paddingMedium),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    CusTimeline(),
                    ...List.generate(widget.taskList.length, (index) {
                      final Task task = widget.taskList[index];
                      final Animation animation = CurvedAnimation(
                        curve: Interval(
                          1 / widget.taskList.length * index,
                          1 / widget.taskList.length * (1 + index),
                        ),
                        parent: _controller,
                      );
                      return Positioned(
                        left: AppConstrain.paddingLarge * 3 * (1 + index),
                        top: 55.0 * index,
                        child: AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, 0),
                              child: Opacity(
                                opacity: animation.value,
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(AppConstrain.paddingSmall),
                            height: 50,
                            width: widget.width * 0.6,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              border: Border.all(color: Color(0xffF2F2F4)),
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: AlignmentGeometry.centerLeft,
                                    child: CusCheckbox(
                                      value: false,
                                      onChanged: (value) {},
                                      radius: 100,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    task.name,
                                    style: TextTheme.of(context).bodySmall,
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Stack(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          Assets.images.avatar.path,
                                          width: 25,
                                        ),
                                      ),
                                      ...List.generate(task.member - 1, (
                                        index,
                                      ) {
                                        return Positioned(
                                          left: 10.0 * index,
                                          child: ClipOval(
                                            child: Image.asset(
                                              Assets.images.avatar.path,
                                              width: 25,
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppConstrain.paddingSmall,
                                        vertical:
                                            AppConstrain.paddingSmall * 0.2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: task.lever.backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                          AppConstrain.borderRadius,
                                        ),
                                      ),
                                      child: Text(
                                        task.lever.label,
                                        style: TextStyle(
                                          color: task.lever.textColor,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.more_horiz_rounded,
                                    color: Color(0xffB3B3BF),
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
