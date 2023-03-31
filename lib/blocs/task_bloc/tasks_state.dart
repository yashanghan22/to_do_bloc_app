// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<task> Pendingtask;
  final List<task> completedtask;
  final List<task> favouiritetask;
  final List<task> removedtask;
  const TasksState({
    this.Pendingtask = const <task>[],
    this.completedtask = const <task>[],
    this.favouiritetask = const <task>[],
    this.removedtask = const <task>[],
  });

  @override
  List<Object> get props => [Pendingtask, removedtask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alltask': Pendingtask.map((x) => x.toMap()).toList(),
      'completedtask': completedtask.map((x) => x.toMap()).toList(),
      'favouiritetask': favouiritetask.map((x) => x.toMap()).toList(),
      'removedtask': removedtask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      Pendingtask: List<task>.from(
        (map['alltask'] as List<int>).map<task>(
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
