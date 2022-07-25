import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/edit_todo/edit_todo.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoBloc, EditTodoState>(
      listener: (context, state) => Navigator.of(context).pop(),
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == EditTodoStatus.success,
      child: const EditTodoView(),
    );
  }
}

class EditTodoView extends StatelessWidget {
  const EditTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final isNewTodo = context.select(
      (EditTodoBloc bloc) => bloc.state.isNewTodo,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewTodo ? 'Add Todo' : 'Edit Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Todo save',
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        onPressed: () {

        },
      ),
    );
  }
}
