import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/models/todo_item.dart';
import 'package:fluttertodo/screens/todo/providers/todo_state.dart';

final todoProvider = StateNotifierProvider<TodoProvider, TodoState>((ref) {
  return TodoProvider();
});

class TodoProvider extends StateNotifier<TodoState> {
  TodoProvider() : super(TodoState(todos: []));

  void addTodo(TodoItem item) => state = state.addTodo(todoItem: item);
  void updateTodo(String id) => state = state.updateTodoStatus(id: id);
  void clearAllTodos() => state = state.copyWith(todos: []);
  void removeTodo(String id) => state = state.removeTodo(id: id);
}
