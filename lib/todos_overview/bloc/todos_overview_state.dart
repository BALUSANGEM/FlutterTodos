part of 'todos_overview_bloc.dart';

enum TodoOverviewStatus { initial, loading, success, failure }

class TodosOverViewState {
  const TodosOverViewState({
    this.status = TodoOverviewStatus.initial,
    this.todos = const [],
    this.lastDeletedTodo,
  });

  final TodoOverviewStatus status;
  final List<Todo> todos;
  final Todo? lastDeletedTodo;
}
