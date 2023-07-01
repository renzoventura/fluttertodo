import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/constants/constants.dart';
import 'package:fluttertodo/models/todo_item.dart';

import '../providers/todo_provider.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile(this.item, {super.key});

  final TodoItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoProvider.notifier);

    Color backgroundColor = !item.isCompleted ? primaryColor : secondaryColor;
    Color textColor = !item.isCompleted ? Colors.white : Colors.black12;
    TextDecoration textDecoration =
        item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    Widget getCheckBox() {
      if (item.isCompleted) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
          child: Icon(Icons.check, color: primaryColor, size: 18, weight: 48),
        );
      } else {
        return const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          provider.updateTodo(item.id);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: [
                getCheckBox(),
                const SizedBox(width: 8),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        decoration: textDecoration,
                        decorationColor: Colors.black12,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
