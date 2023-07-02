import 'package:fluttertodo/models/todo_item.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final Database _database;

  DatabaseHelper(this._database);

  Future<List<TodoItem>> getTodos() async {
    final db = _database;
    final result = await db.query('todos');
    return result.map((data) => TodoItem.fromJson(data)).toList();
  }

  Future<void> insertTodo(TodoItem todo) async {
    await _database.insert('todos', todo.toDatabaseMap());
  }

  Future<void> updateTodoStatus(TodoItem todo) async {
    await _database.update(
      'todos',
      {'isCompleted': todo.getIsCompletedAsInt()},
      where: 'id = ?',
      whereArgs: [todo.id],
    );
    // await _database.update('todos', todo.toDatabaseMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTodos(String id) async {
    await _database.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllTodos() async {
    await _database.delete('todos');
  }
}
