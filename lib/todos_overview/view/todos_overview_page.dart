import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/todos_overview/bloc/todos_overview_bloc.dart';
import 'package:todos_repository/todos_repository.dart';

class TodosOverviewPage extends StatelessWidget {
  const TodosOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosOverviewBloc(
        todosRepository: context.read<TodosRepository>(),
      )..add(const TodosOverviewSubscriptionRequested()),
      child: const TodosOverviewView(),
    );
  }
}

class TodosOverviewView extends StatelessWidget {
  const TodosOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos overview'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TodosOverviewBloc, TodosOverViewState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == TodoOverviewStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(content: Text('Error!')));
              }
            },
          ),
          BlocListener<TodosOverviewBloc, TodosOverViewState>(
            listenWhen: (previous, current) =>
                previous.lastDeletedTodo != current.lastDeletedTodo &&
                current.lastDeletedTodo != null,
            listener: (context, state) {
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: const Text('Undo deletion'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      messenger.hideCurrentSnackBar();
                      context
                          .read<TodosOverviewBloc>()
                          .add(const TodosOverviewUndoDeletionRequested());
                    },
                  ),
                ));
            },
          )
        ],
        child: BlocBuilder<TodosOverviewBloc, TodosOverViewState>(
          builder: (contexts, state) {
            if (state.todos.isEmpty) {
              if (state.status == TodoOverviewStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.status != TodoOverviewStatus.success) {
                return const SizedBox();
              } else {
                return Center(
                  child: Text(
                    'No todos yet!',
                    style: Theme.of(contexts).textTheme.caption,
                  ),
                );
              }
            }
            return CupertinoScrollbar(
                child: ListView(
              children: [
                for (final todo in state.todos) TodoListTitle(todo: todo)
              ],
            ));
          },
        ),
      ),
    );
  }
}

class TodoListTitle extends StatelessWidget {
  const TodoListTitle({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Text(todo.title);
  }
}
