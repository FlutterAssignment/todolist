import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';
import '../../widgets/task_tile.dart';
import 'add_task_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),
      body: provider.tasks.isEmpty
          ? const Center(child: Text("No tasks yet"))
          : ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (_, index) {
                final task = provider.tasks[index];
                return TaskTile(task: task);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
      ),
    );
  }
}
