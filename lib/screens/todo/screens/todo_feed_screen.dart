import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/screens/todo/components/todo_feed.dart';
import 'package:fluttertodo/screens/todo/components/todo_textfield.dart';
import 'package:fluttertodo/screens/todo/components/todo_title_bar.dart';

class TodoFeedScreen extends ConsumerStatefulWidget {
  const TodoFeedScreen({super.key});

  @override
  ConsumerState createState() => _TodoFeedScreenState();
}

class _TodoFeedScreenState extends ConsumerState<TodoFeedScreen> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TodoTitleBar(),
                const SizedBox(height: 16),
                TodoTextField(scrollController: controller),
                const SizedBox(height: 16),
                Expanded(child: TodoFeed(scrollController: controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
