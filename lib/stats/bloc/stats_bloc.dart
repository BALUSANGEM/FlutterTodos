import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_repository/todos_repository.dart';

part 'stats_events.dart';

part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({
    required TodosRepository todoRepository,
  })  : _todosRepository = todoRepository,
        super(const StatsState()) {
    on<StatsSubscriptionRequested>(_onStatsRequested);
  }

  final TodosRepository _todosRepository;

  Future<void> _onStatsRequested(
    StatsSubscriptionRequested event,
    Emitter<StatsState> emit,
  ) async {
    emit(state.copyWith(status: StatsStatus.loading));
    await emit.forEach<List<Todo>>(
      _todosRepository.getTodos(),
      onData: (todos) => state.copyWith(
        status: StatsStatus.success,
        activeTodos: todos.where((todo) => !todo.isCompleted).length,
        completedTodos: todos.where((todo) => todo.isCompleted).length,
      ),
      onError: (_, __) => state.copyWith(
        status: StatsStatus.failure,
      ),
    );
  }
}
