// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<task> pendingtask;
  final List<task> completedtask;
  final List<task> favouiritetask;
  final List<task> removedtask;
  const TasksState({
    this.pendingtask = const [],
    this.completedtask = const [],
    this.favouiritetask = const [],
    this.removedtask = const [],
  });

  @override
  List<Object> get props =>
      [pendingtask, completedtask, favouiritetask, removedtask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Pendingtask': pendingtask.map((x) => x.toMap()).toList(),
      'completedtask': completedtask.map((x) => x.toMap()).toList(),
      'favouiritetask': favouiritetask.map((x) => x.toMap()).toList(),
      'removedtask': removedtask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingtask: List<task>.from(
        (map['Pendingtask'] as List<int>).map<task>(
          (x) => task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedtask: List<task>.from(
        (map['completedtask'] as List<int>).map<task>(
          (x) => task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favouiritetask: List<task>.from(
        (map['favouiritetask'] as List<int>).map<task>(
          (x) => task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedtask: List<task>.from(
        (map['removedtask'] as List<int>).map<task>(
          (x) => task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

// class TasksInitial extends TasksState {}
