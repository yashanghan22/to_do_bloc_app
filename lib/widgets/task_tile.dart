import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';

import '../model/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.Task,
  });

  final task Task;

  void _removeorDeleteTask(BuildContext ctx, task Task) {
    Task.isDeleted!
        ? ctx.read<TasksBloc>().add(Deletetask(Task: Task))
        : ctx.read<TasksBloc>().add(Removetask(Task: Task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Task.title,
        style: TextStyle(
            decoration: Task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: Task.isDone,
        onChanged: Task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(Updatetask(Task: Task));
              }
            : null,
      ),
      onLongPress: () => _removeorDeleteTask(context, Task),
    );
  }
}
