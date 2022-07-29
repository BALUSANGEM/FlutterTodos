import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/todos_overview/bloc/todos_overview_bloc.dart';
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

    setUpAll(() {
      registerFallbackValue(FakeTodo());
    });

    setUp(() {
      todosRepository = MockTodoRepository();
      when(() => todosRepository.saveTodo(any())).thenAnswer((_) async {});
      when(() => todosRepository.getTodos())
          .thenAnswer((_) => Stream.value(mockTodos));
    });

    TodosOverviewBloc buildBloc() {
      return TodosOverviewBloc(todosRepository: todosRepository);
    }

    group('TodosOverviewSubscriptionRequested', () {
      blocTest<TodosOverviewBloc, TodosOverViewState>(
        'Start listening to repository get todos stream',
        build: buildBloc,
        act: (bloc) => bloc.add(const TodosOverviewSubscriptionRequested()),
        verify: (_) {
          verify(() => todosRepository.getTodos()).called(1);
        },
      );
    });
  });
}
