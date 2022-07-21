part of 'todos_overview_bloc.dart';

abstract class TodosOverviewEvent {}

class TodosOverviewSubscriptionRequested extends TodosOverviewEvent {
  TodosOverviewSubscriptionRequested();
}

class TodosOverviewCompletionToggled extends TodosOverviewEvent {
  TodosOverviewCompletionToggled(
      {required this.todo, required this.isCompleted});

  final Todo todo;
  final bool isCompleted;
}

class TodosOverviewTodoDeleted extends TodosOverviewEvent {
  TodosOverviewTodoDeleted({required this.todo});

  final Todo todo;
}

class TodosOverviewUndoDeletionRequested extends TodosOverviewEvent {
  TodosOverviewUndoDeletionRequested();
}

class TodosOverviewToggleAllRequested extends TodosOverviewEvent {
  TodosOverviewToggleAllRequested();
}

class TodosOverviewClearCompletedRequested extends TodosOverviewEvent {
  TodosOverviewClearCompletedRequested();
}
