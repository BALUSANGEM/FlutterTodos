import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TodosOverviewOption { toggleAll, allCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodosOverviewOption>(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      tooltip: 'Todos overview',
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosOverviewOption.toggleAll,
            child: child,
          ),
          PopupMenuItem(
            value: TodosOverviewOption.allCompleted,
            child: child,
          )
        ];
      },
    );
  }
}
