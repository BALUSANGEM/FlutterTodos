import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todos_repository/todos_repository.dart';

class MockTodoRepository extends Mock implements TodosRepository {}

class FakeTodo extends Fake implements Todo {}

void main() {
  final mockTodos = [
    Todo(id: '1', title: 'title 1', description: 'description 1'),
    Todo(id: '2', title: 'title 2', description: 'description 2'),
    Todo(id: '3', title: 'title 3', description: 'description 3')
  ];
  group('TodosOverviewBloc', () {
    late TodosRepository todosRepository;
    setUp(() {
      todosRepository = MockTodoRepository();
      when(() => todosRepository.saveTodo(any())).thenAnswer((_) async {});
      when(() => todosRepository.getTodos())
          .thenAnswer((_) => Stream.value(mockTodos));
    });
  });
}
