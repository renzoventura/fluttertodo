import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/di/get_it.dart';
import 'package:fluttertodo/models/todo_item.dart';
import 'package:fluttertodo/screens/todo/providers/todo_state.dart';
import 'package:fluttertodo/services/database_helper.dart';

final todoProvider = StateNotifierProvider<TodoProvider, TodoState>((ref) {
  return TodoProvider();
});

class TodoProvider extends StateNotifier<TodoState> {
  DatabaseHelper db = getIt<DatabaseHelper>();

  TodoProvider() : super(TodoState(todos: [])) {
    loadTodosFromDatabase();
  }

  Future<void> loadTodosFromDatabase() async {
    final todos = await db.getTodos();
    state = state.copyWith(todos: todos);
  }

  void addTodo(TodoItem item) async {
    await db.insertOrUpdateTodo(item);
    state = state.addTodo(todoItem: item);
  }

  void updateTodo(String id) {
    state = state.updateTodoStatus(id: id);
  }

  void clearAllTodos() async {
    await db.deleteAllTodos();
    state = state.copyWith(todos: []);
  }

  void removeTodo(String id) async {
    await db.deleteTodos(id);
    state = state.removeTodo(id: id);
  }
}
