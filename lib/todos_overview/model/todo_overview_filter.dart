import 'package:todos_repository/todos_repository.dart';

enum TodoOverViewFilter { all, activeOnly, completedOnly }

extension TodosViewFilterX on TodoOverViewFilter {
  bool apply(Todo todo) {
    switch (this) {
      case TodoOverViewFilter.all:
        return true;
      case TodoOverViewFilter.activeOnly:
        return !todo.isCompleted;
      case TodoOverViewFilter.completedOnly:
        return todo.isCompleted;
    }
  }

  Iterable<Todo> applyAll(Iterable<Todo> todos) {
    return todos.where(apply);
  }
}
