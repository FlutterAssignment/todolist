import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class LocalStorageService {
  static const _key = 'todo_tasks_v1';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);

    if (raw == null) return [];

    final decoded = jsonDecode(raw) as List;
    return decoded.map((e) => Task.fromJson(e)).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await prefs.setString(_key, raw);
  }
}
