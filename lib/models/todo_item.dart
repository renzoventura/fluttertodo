import 'package:json_annotation/json_annotation.dart';

part 'todo_item.g.dart';

@JsonSerializable()
class TodoItem {
  final String id;
  final String title;

  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  bool isCompleted;

  static bool _boolFromInt(int done) => done == 1;

  static int _boolToInt(bool done) => done ? 1 : 0;

  TodoItem({required this.id, required this.title, this.isCompleted = false});

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);

  Map<String, dynamic> toDatabaseMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  int getIsCompletedAsInt() => isCompleted ? 1 : 0;
}
