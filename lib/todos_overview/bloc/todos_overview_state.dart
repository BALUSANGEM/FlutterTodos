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

  TodosOverViewState copyWith({
    TodoOverviewStatus? status,
    List<Todo>? todos,
    Todo? lastDeletedTodo,
  }) {
    return TodosOverViewState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      lastDeletedTodo: lastDeletedTodo ?? this.lastDeletedTodo,
    );
  }
}
