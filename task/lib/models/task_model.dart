import 'dart:convert';

class Task {
  String id;
  String title;
  String? description;
  bool completed;
  DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.completed = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        completed: json['completed'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "completed": completed,
        "createdAt": createdAt.toIso8601String(),
      };
}
