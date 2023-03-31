// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';
import 'package:to_do_bloc_app/model/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(const TasksState(
            pendingtask: [],
            completedtask: [],
            favouiritetask: [],
            removedtask: [])) {
    on<Addtask>(_onaddTask);
    on<Updatetask>(_onUpdateTask);
    on<Deletetask>(_onDeleteTask);
    on<Removetask>(_onRemoveTask);
  }
  void _onaddTask(Addtask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingtask: List.from(state.pendingtask)..add(event.task),
        removedtask: state.removedtask,
        completedtask: state.completedtask,
        favouiritetask: state.favouiritetask));
  }

  void _onUpdateTask(Updatetask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingtasks = state.pendingtask;
    List<Task> completedtasks = state.completedtask;

    task.isDone == false
        ? {
            pendingtasks = List.from(pendingtasks)..remove(task),
            completedtasks = List.from(completedtasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedtasks = List.from(completedtasks)..remove(task),
            pendingtasks = List.from(pendingtasks)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(TasksState(
        pendingtask: pendingtasks,
        removedtask: state.removedtask,
        completedtask: completedtasks,
        favouiritetask: state.favouiritetask));
  }

  void _onDeleteTask(Deletetask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingtask: state.pendingtask,
        completedtask: state.completedtask,
        favouiritetask: state.favouiritetask,
        removedtask: List.from(state.removedtask)..remove(event.task)));
  }

  void _onRemoveTask(Removetask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingtask: List.from(state.pendingtask)..remove(event.task),
        completedtask: List.from(state.completedtask)..remove(event.task),
        favouiritetask: List.from(state.favouiritetask)..remove(event.task),
        removedtask: List.from(state.removedtask)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
