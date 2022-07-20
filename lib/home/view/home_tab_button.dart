import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/home/home_cubit.dart';

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    super.key,
    required this.icon,
    required this.tab,
    required this.selectedTab,
  });

  final Widget icon;
  final HomeTab tab;
  final HomeTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(tab),
      iconSize: 32,
      icon: icon,
      color: selectedTab != tab ? null : Theme.of(context).colorScheme.primary,
    );
  }
}
