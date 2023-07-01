import 'package:fluttertodo/models/todo_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final Database _database;

  DatabaseHelper(this._database);

  Future<List<TodoItem>> getTodos() async {
    final db = await _database;
    final result = await db.query('todos');
    return result.map((data) => TodoItem.fromJson(data)).toList();
  }

  Future<void> insertOrUpdateTodo(TodoItem todo) async {
    print(todo.toDatabaseMap());
    await _database.insert('todos', todo.toDatabaseMap());
  }

  Future<void> deleteTodos(String id) async {
    await _database.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllTodos() async {
    await _database.delete('todos');
  }
}
