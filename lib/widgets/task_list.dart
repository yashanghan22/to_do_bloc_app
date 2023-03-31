import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';
import 'package:to_do_bloc_app/widgets/task_tile.dart';

import '../model/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasklist,
  });

  final List<task> tasklist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 500,
      // width: double.maxFinite,
      child: ListView.builder(
        itemCount: tasklist.length,
        itemBuilder: (context, index) {
          var task = tasklist[index];
          return TaskTile(Task: task);
        },
      ),
    );
  }
}
