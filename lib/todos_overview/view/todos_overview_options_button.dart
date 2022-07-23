import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/todos_overview/bloc/todos_overview_bloc.dart';

enum TodosOverviewOption { toggleAll, allCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.select((TodosOverviewBloc bloc) => bloc.state.todos);
    final completedTodosCount = todos.where((todo) => todo.isCompleted).length;
    return PopupMenuButton<TodosOverviewOption>(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      tooltip: 'Todos overview',
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosOverviewOption.toggleAll,
            child: Text(
              completedTodosCount == todos.length
                  ? 'Mark all Incomplete'
                  : 'Mark all Complete',
            ),
          ),
          PopupMenuItem(
            value: TodosOverviewOption.allCompleted,
            child: Text('Clear completed'),
          )
        ];
      },
    );
  }
}
