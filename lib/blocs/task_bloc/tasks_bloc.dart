// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:to_do_bloc_app/blocs/bloc_exports.dart';
import 'package:to_do_bloc_app/model/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    void _onaddTask(Addtask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
          Pendingtask: List.from(state.Pendingtask)..add(event.Task),
          removedtask: state.removedtask,
          completedtask: state.completedtask,
          favouiritetask: state.favouiritetask));
    }

    void _onUpdateTask(Updatetask event, Emitter<TasksState> emit) {
      final state = this.state;
      final TasK = event.Task;

      List<task> pendingtasks = state.Pendingtask;
      List<task> completedtasks = state.completedtask;

      TasK.isDone == false
          ? {
              pendingtasks = List.from(pendingtasks)..remove(TasK),
              completedtasks = List.from(completedtasks)
                ..insert(0, TasK.copyWith(isDone: true)),
            }
          : {
              completedtasks = List.from(completedtasks)..remove(TasK),
              pendingtasks = List.from(pendingtasks)
                ..insert(0, TasK.copyWith(isDone: false)),
            };
      emit(TasksState(
          Pendingtask: pendingtasks,
          removedtask: state.removedtask,
          completedtask: completedtasks,
          favouiritetask: state.favouiritetask));
    }

    void _onDeleteTask(Deletetask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
          Pendingtask: state.Pendingtask,
          completedtask: state.completedtask,
          favouiritetask: state.favouiritetask,
          removedtask: List.from(state.removedtask)..remove(event.Task)));
    }

    void _onRemoveTask(Removetask event, Emitter<TasksState> emit) {
      final state = this.state;
      emit(TasksState(
          Pendingtask: List.from(state.Pendingtask)..remove(event.Task),
          completedtask: List.from(state.completedtask)..remove(event.Task),
          favouiritetask: List.from(state.favouiritetask)..remove(event.Task),
          removedtask: List.from(state.removedtask)
            ..add(event.Task.copyWith(isDeleted: true))));
    }

    on<Addtask>(_onaddTask);
    on<Updatetask>(_onUpdateTask);
    on<Deletetask>(_onDeleteTask);
    on<Removetask>(_onRemoveTask);
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
