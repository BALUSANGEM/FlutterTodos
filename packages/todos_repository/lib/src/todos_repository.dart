import 'package:todos_api/todos_api.dart';

class TodosRepository {
  final TodosApi _todosApi;

  const TodosRepository({required TodosApi todosApi}) : _todosApi = todosApi;
}
