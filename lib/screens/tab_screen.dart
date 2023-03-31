import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/screens/Completed_task_screen.dart';
import 'package:to_do_bloc_app/screens/favourite_task_screen.dart';
import 'package:to_do_bloc_app/screens/pending_task_screen.dart';

import '../widgets/add_task_widget.dart';
import 'my_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = '/';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pagedetails = [
    {
      'pagename': const PendingTaskScreen(title: 'Pending Tasks'),
      'title': 'Pending Tasks'
    },
    {
      'pagename': const CompletedTaskScreen(title: 'Completed Tasks'),
      'title': 'Completed Tasks'
    },
    {
      'pagename': const FavouriteTaskScreen(title: 'Favourite Tasks'),
      'title': 'Favourite Tasks'
    },
  ];

  var _selectedpageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddTaskWidget(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          '${_pagedetails[_selectedpageIndex]['title']}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      body: _pagedetails[_selectedpageIndex]['pagename'],
      drawer: const MyDrawer(),
      floatingActionButton: _selectedpageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add task',
              backgroundColor: Colors.indigo[900],
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Pending tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favourite tasks'),
        ],
        currentIndex: _selectedpageIndex,
        onTap: (value) {
          setState(() {
            _selectedpageIndex = value;
          });
        },
      ),
    );
  }
}
