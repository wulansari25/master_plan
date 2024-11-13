import 'package:master_plan/models/task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  const Plan(late, {this.name = '', this.tasks = const []});
int get completedCount => tasks
 .where((task) => task.isComplete)
 .length;
String get completenessMessage =>
 '$completedCount out of ${tasks.length} tasks';
}