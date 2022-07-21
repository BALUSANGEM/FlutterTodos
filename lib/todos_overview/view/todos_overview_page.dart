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
              print('Block changed status: ${state.status}');
              print('Block changed status: ${state.todos}');
            },
          )
        ],
        child: BlocBuilder<TodosOverviewBloc, TodosOverViewState>(
          builder: (context, state) {
            if (state.todos.isEmpty) {
              if (state.status == TodoOverviewStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                return const Center(child: Text('No todos yet!'));
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
