import 'package:todos_api/src/models/models.dart';

/// {@template todos_api}
/// API package with interface and modesl for providing access to todos
/// {@endtemplate}
abstract class TodosApi {
  /// {@macro todos_api}
  const TodosApi();

  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<int> clearTodos();
}

class TodoNotFoundException implements Exception {}
