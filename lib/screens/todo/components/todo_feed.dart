import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/screens/todo/components/todo_tile.dart';
import 'package:fluttertodo/screens/todo/providers/todo_provider.dart';

class TodoFeed extends ConsumerWidget {
  const TodoFeed({required this.scrollController, super.key});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);
    final provider = ref.watch(todoProvider.notifier);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onPanDown: (_) {
      //   FocusScope.of(context).requestFocus(FocusNode());
      // },
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: todoState.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: GlobalKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (DismissDirection d) {
              if (d == DismissDirection.startToEnd) {
                provider.removeTodo(todoState.todos[index].id);
              }
            },
            child: TodoTile(
              todoState.todos[index],
            ),
          );
        },
      ),
    );
  }
}
