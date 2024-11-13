// data_layer.dart
class Plan {
  final String name;
  final List<Task> tasks;

  Plan({required this.name, required this.tasks});

  int get completedTaskCount {
    // Menghitung jumlah task yang memiliki isComplete == true
    return tasks.where((task) => task.isComplete).length;
  }
}

class Task {
  final String name;
  bool isComplete;

  Task({required this.name, this.isComplete = false});
}