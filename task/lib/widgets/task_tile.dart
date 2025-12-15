import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);

    return ListTile(
      leading: IconButton(
        icon: Icon(
          task.completed ? Icons.check_circle : Icons.circle_outlined,
        ),
        onPressed: () => provider.toggleCompleted(task.id),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: task.description != null ? Text(task.description!) : null,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => provider.deleteTask(task.id),
      ),
    );
  }
}
