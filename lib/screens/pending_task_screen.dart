import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../model/task_model.dart';
import '../widgets/task_list.dart';

class PendingTaskScreen extends StatefulWidget {
  const PendingTaskScreen({super.key, required this.title});
  static const id = 'tasks_screen';

  final String title;

  @override
  State<PendingTaskScreen> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<PendingTaskScreen> {
  // List<task> tasklist = [
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<task> taskslist = state.pendingtask;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Chip(
                  label: Text(
                      '${state.pendingtask.length} Pending | ${state.completedtask.length} Completed')),
            ),
            TaskList(tasklist: taskslist)
          ],
        );
      },
    );
  }
}
