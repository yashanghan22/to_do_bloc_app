import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${state.removedtask.length} Tasks')),
              ),
              TaskList(tasklist: state.removedtask)
            ],
          ),
          drawer: const MyDrawer(),
        );
      },
    );
  }
}
