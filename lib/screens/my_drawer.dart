import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/screens/recycle_bin.dart';
import 'package:to_do_bloc_app/screens/tab_screen.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 90,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.indigo[700],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Text('Task Drawer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(TabScreen.id);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.folder_special,
                      color: Colors.indigo[900],
                    ),
                    title: const Text('My Tasks'),
                    trailing: Text(
                        '${state.pendingtask.length}| ${state.completedtask.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id);
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedtask.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
