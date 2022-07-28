import 'package:mocktail/mocktail.dart';
import 'package:todos_repository/todos_repository.dart';

class MockTodoRepository extends Mock implements TodosRepository {}

class FakeTodo extends Fake implements Todo {}
