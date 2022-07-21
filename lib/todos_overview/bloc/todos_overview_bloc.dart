import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_repository/todos_repository.dart';

part 'todos_overview_event.dart';

part 'todos_overview_state.dart';

class TodosOverviewBloc extends Bloc<TodosOverviewEvent, TodosOverViewState> {
  TodosOverviewBloc({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const TodosOverViewState()) {
    on<TodosOverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<TodosOverviewCompletionToggled>(_onTodoCompletionToggled);
    on<TodosOverviewTodoDeleted>(_onTodoDeleted);
  }

  final TodosRepository _todosRepository;

  Future<void> _onSubscriptionRequested(
    TodosOverviewSubscriptionRequested event,
    Emitter<TodosOverViewState> emit,
  ) async {
    emit(state.copyWith(status: TodoOverviewStatus.loading));
    await emit.forEach<List<Todo>>(
      _todosRepository.getTodos(),
      onData: (todos) => state.copyWith(
        todos: todos,
        status: TodoOverviewStatus.success,
      ),
      onError: (_, __) => state.copyWith(
        status: TodoOverviewStatus.failure,
      ),
    );
  }

  FutureOr<void> _onTodoCompletionToggled(
    TodosOverviewCompletionToggled event,
    Emitter<TodosOverViewState> emit,
  ) {
    final updatedTodo = event.todo.copyWith(isCompleted: event.isCompleted);
    _todosRepository.saveTodo(updatedTodo);
  }

  FutureOr<void> _onTodoDeleted(
    TodosOverviewTodoDeleted event,
    Emitter<TodosOverViewState> emit,
  ) {
    emit(state.copyWith(lastDeletedTodo: event.todo));
    _todosRepository.deleteTodo(event.todo.id);
  }
}
