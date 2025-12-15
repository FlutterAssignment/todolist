import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/local_storage_service.dart';

class TaskProvider extends ChangeNotifier {
  final LocalStorageService _storage = LocalStorageService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await _storage.loadTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.insert(0, task);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> toggleCompleted(String id) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index == -1) return;

    _tasks[index].completed = !_tasks[index].completed;
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((t) => t.id == id);
    await _storage.saveTasks(_tasks);
    notifyListeners();
  }
}
