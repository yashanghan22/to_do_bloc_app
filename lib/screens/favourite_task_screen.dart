import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../model/task_model.dart';
import '../widgets/task_list.dart';

class FavouriteTaskScreen extends StatefulWidget {
  const FavouriteTaskScreen({super.key, required this.title});
  static const id = 'tasks_screen';

  final String title;

  @override
  State<FavouriteTaskScreen> createState() => _FavouriteTaskScreenState();
}

class _FavouriteTaskScreenState extends State<FavouriteTaskScreen> {
  // List<task> tasklist = [
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskslist = state.favouiritetask;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Chip(label: Text('${state.favouiritetask.length} Tasks')),
            ),
            TaskList(tasklist: taskslist)
          ],
        );
      },
    );
  }
}
