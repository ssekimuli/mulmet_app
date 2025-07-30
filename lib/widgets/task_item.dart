import 'package:flutter/material.dart';
import 'package:mulmet_app/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;
  final Function() onDeleted;

  const TaskItem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) => onChanged(value ?? false),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDeleted,
        ),
      ),
    );
  }
}