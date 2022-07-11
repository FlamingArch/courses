import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/Models/task.dart';

class TaskData extends ChangeNotifier {
  var _tasks = [
    Task(name: "Buy AMD Ryzen 9 5950x"),
    Task(name: "Buy Gigabyte RTX 3090 Vision"),
    Task(name: "Buy Trident Z Royal 128GB 4000Mhz"),
    Task(name: "Buy AsRock X570 Taichi"),
    Task(name: "Buy Sabrant Rocket 4 Pro 1TB"),
    Task(name: "Buy Sabrant Rocket 4 Pro 4TB"),
    Task(name: "Buy Lian Li O11 Dynamic XL"),
    Task(name: "Buy Lian Li Uni Fan 120 3 Pack x 3"),
    Task(name: "Buy Corsair HX1200i"),
    Task(name: "Buy Logitech G915 GL-Tactile"),
    Task(name: "Buy Logitech G502 Lightspeed"),
    Task(name: "Buy Logitech G560"),
    Task(name: "Buy SteelSeries Arctis 7 2019"),
    Task(name: "Buy SteelSeries Arctis 7 2019"),
  ];

  int get taskCount => _tasks.length;

  void addTask(String name) {
    _tasks.insert(0, Task(name: name));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
}
