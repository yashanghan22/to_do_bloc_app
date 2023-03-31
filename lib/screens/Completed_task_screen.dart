import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../model/task_model.dart';
import '../widgets/task_list.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key, required this.title});
  static const id = 'tasks_screen';

  final String title;

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  // List<task> tasklist = [
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<task> taskslist = state.completedtask;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Chip(label: Text('${state.completedtask.length} Tasks')),
            ),
            TaskList(tasklist: taskslist)
          ],
        );
      },
    );
  }
}
