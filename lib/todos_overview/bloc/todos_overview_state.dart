part of 'todos_overview_bloc.dart';

enum TodoOverviewStatus { initial, loading, success, failure }

class TodosOverViewState extends Equatable {
  const TodosOverViewState({
    this.status = TodoOverviewStatus.initial,
    this.todos = const [],
    this.lastDeletedTodo,
    this.filter = TodoOverViewFilter.all,
  });

  final TodoOverviewStatus status;
  final List<Todo> todos;
  final Todo? lastDeletedTodo;
  final TodoOverViewFilter filter;

  TodosOverViewState copyWith({
    TodoOverviewStatus? status,
    List<Todo>? todos,
    Todo? lastDeletedTodo,
    TodoOverViewFilter? filter,
  }) {
    return TodosOverViewState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      lastDeletedTodo: lastDeletedTodo ?? this.lastDeletedTodo,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [status, todos, lastDeletedTodo, filter];
}
