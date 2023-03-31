import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';

import '../model/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeorDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(Deletetask(task: task))
        : ctx.read<TasksBloc>().add(Removetask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(Updatetask(task: task));
              }
            : null,
      ),
      onLongPress: () => _removeorDeleteTask(context, task),
    );
  }
}
