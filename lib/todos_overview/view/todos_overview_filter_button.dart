import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/todos_overview/bloc/todos_overview_bloc.dart';
import 'package:flutter_todos/todos_overview/model/model.dart';

class TodosOverviewFilterButton extends StatelessWidget {
  const TodosOverviewFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final activeFilter = context.read<TodosOverviewBloc>().state.filter;
    return PopupMenuButton<TodoOverViewFilter>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: activeFilter,
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: TodoOverViewFilter.all,
            child: Text('All'),
          ),
          PopupMenuItem(
            value: TodoOverViewFilter.activeOnly,
            child: Text('Active'),
          ),
          PopupMenuItem(
            value: TodoOverViewFilter.completedOnly,
            child: Text('Completed'),
          )
        ];
      },
    );
  }
}
