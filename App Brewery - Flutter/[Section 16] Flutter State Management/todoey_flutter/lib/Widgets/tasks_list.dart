import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Models/task_data.dart';
import 'package:todoey_flutter/Widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 30),
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          var task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallback: (val) {
              taskData.updateTask(task);
            },
            longPressCallback: () => taskData.deleteTask(task),
          );
        },
      ),
    );
  }
}
