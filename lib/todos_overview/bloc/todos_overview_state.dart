import 'package:todos_repository/todos_repository.dart';

enum TodoOverviewStatus { initial, loading, success, failure }

class TodoOverviewState {
  const TodoOverviewState({
    this.status = TodoOverviewStatus.initial,
    this.todos = const [],
    this.lastDeletedTodo,
  });

  final TodoOverviewStatus status;
  final List<Todo> todos;
  final Todo? lastDeletedTodo;
}
