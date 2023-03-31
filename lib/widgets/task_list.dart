import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/widgets/task_tile.dart';

import '../model/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasklist,
  });

  final List<Task> tasklist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasklist
              .map((e) => ExpansionPanelRadio(
                  value: e.id,
                  headerBuilder: (context, isExpanded) {
                    return TaskTile(task: e);
                  },
                  body: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${e.title}\n'),
                      const TextSpan(
                        text: '\nDescription\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${e.description}\n'),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

// Expanded(
//       // height: 500,
//       // width: double.maxFinite,
//       child: ListView.builder(
//         itemCount: tasklist.length,
//         itemBuilder: (context, index) {
//           var task = tasklist[index];
//           return TaskTile(Task: task);
//         },
//       ),
//     );