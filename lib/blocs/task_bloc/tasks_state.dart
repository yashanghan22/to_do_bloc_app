// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingtask;
  final List<Task> completedtask;
  final List<Task> favouiritetask;
  final List<Task> removedtask;
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
      pendingtask: List<Task>.from(
        (map['Pendingtask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedtask: List<Task>.from(
        (map['completedtask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favouiritetask: List<Task>.from(
        (map['favouiritetask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedtask: List<Task>.from(
        (map['removedtask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

// class TasksInitial extends TasksState {}
