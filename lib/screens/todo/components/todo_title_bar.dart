import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/screens/todo/providers/todo_provider.dart';

class TodoTitleBar extends ConsumerWidget {
  const TodoTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'To do',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Clear all'),
                  content: const Text('Are you sure you want to clear all?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        provider.clearAllTodos();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.restore_from_trash_rounded,
            color: Colors.grey,
            size: 38,
          ),
        ),
      ],
    );
  }
}
