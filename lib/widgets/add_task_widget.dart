import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';
import 'package:to_do_bloc_app/model/task_model.dart';
import 'package:to_do_bloc_app/services/guid_gen.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Add Task', style: TextStyle(fontSize: 25)),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titlecontroller,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var tasks = task(
                        title: titlecontroller.text, id: GUIDGen.generate());
                    context.read<TasksBloc>().add(Addtask(Task: tasks));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'))
            ],
          ),
        ],
      ),
    );
  }
}
