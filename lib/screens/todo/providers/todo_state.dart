import 'package:fluttertodo/models/todo_item.dart';

class TodoState {
  TodoState({required this.todos});

  List<TodoItem> todos = [];

  TodoState copyWith({List<TodoItem>? todos}) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  TodoState addTodo({required TodoItem todoItem}) {
    List<TodoItem> newTodos = todos;
    newTodos.add(todoItem);
    return TodoState(todos: todos);
  }

  TodoState updateTodoStatus({required String id}) {
    TodoItem? itemToUpdate =
        todos.where((element) => element.id == id).firstOrNull;
    if (itemToUpdate != null) {
      itemToUpdate.isCompleted = !itemToUpdate.isCompleted;
    }
    return TodoState(todos: todos);
  }

  TodoState removeTodo({required String id}) {
    TodoItem? itemToUpdate =
        todos.where((element) => element.id == id).firstOrNull;
    if (itemToUpdate != null) {
      todos.remove(itemToUpdate);
    }
    return TodoState(todos: todos);
  }
}
