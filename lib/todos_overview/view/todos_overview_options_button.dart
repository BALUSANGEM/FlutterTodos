import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TodosOverviewOption { toggleAll, allCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton<TodosOverviewOption>(itemBuilder: itemBuilder)
  }

}
