import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/constants/constants.dart';
import 'package:fluttertodo/models/todo_item.dart';
import 'package:fluttertodo/screens/todo/providers/todo_provider.dart';
import 'package:uuid/uuid.dart';

class TodoTextField extends ConsumerStatefulWidget {
  const TodoTextField({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  ConsumerState createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends ConsumerState<TodoTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(todoProvider.notifier);

    return TextFormField(
      cursorColor: primaryColor,
      controller: controller,
      decoration: addTodoTextFieldDecoration,
      onEditingComplete: () {},
      onFieldSubmitted: (String value) async {
        if (value.isEmpty || value == "") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Cannot be empty',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ));
        } else {
          var uuid = const Uuid();
          provider.addTodo(TodoItem(title: value, id: uuid.v1()));
          await Future.delayed(const Duration(milliseconds: 500));
          widget.scrollController.animateTo(
            widget.scrollController.position.maxScrollExtent,
            duration:  const Duration(milliseconds: 500),
            curve: Curves.easeInQuad,
          );
        }
        controller.clear();
      },
    );
  }
}
