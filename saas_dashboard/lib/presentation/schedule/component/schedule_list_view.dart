import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/presentation/schedule/widget/task_list_card.dart';

class ScheduleListView extends StatefulWidget {
  const ScheduleListView({super.key});

  @override
  State<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final Map<String, List<Task>> _taskMap = {
    "To Do": todoList,
    "Doing": doingList,
    "Done": doneList,
  };

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(_taskMap.length, (index) {
          final String key = _taskMap.keys.elementAt(index);
          final List<Task> taskList = _taskMap[key]!;
          final Animation animation = CurvedAnimation(
            parent: _controller,
            curve: Interval(
              1 / _taskMap.length * index,
              1 / _taskMap.length * (1 + index),
            ),
          );
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 20.0 * (1 - animation.value)),
                child: Opacity(opacity: animation.value, child: child),
              );
            },
            child: TaskListCard(taskList: taskList, title: key),
          );
        }),
      ),
    );
  }
}
