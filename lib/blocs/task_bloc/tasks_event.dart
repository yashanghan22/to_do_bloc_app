// ignore_for_file: non_constant_identifier_names

part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class Addtask extends TasksEvent {
  final task Task;
  const Addtask({required this.Task});
  @override
  List<Object> get props => [Task];
}

class Updatetask extends TasksEvent {
  final task Task;
  const Updatetask({required this.Task});
  @override
  List<Object> get props => [Task];
}

class Deletetask extends TasksEvent {
  final task Task;
  const Deletetask({required this.Task});
  @override
  List<Object> get props => [Task];
}

class Removetask extends TasksEvent {
  final task Task;
  const Removetask({required this.Task});
  @override
  List<Object> get props => [Task];
}
