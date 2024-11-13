import 'package:flutter/material.dart';
import 'provider/plan_provider.dart'; 
import 'models/data_layer.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>([
        // Membuat contoh Plan dengan elemen Task yang sesuai
        Plan(name: "Example Plan", tasks: [
          Task(name: "Task 1"),
          Task(name: "Task 2"),
        ]),
      ]),
      child: MaterialApp(
        title: 'State Management App',
        theme: ThemeData(
          primarySwatch: Colors.purple, // Mengubah warna utama menjadi ungu
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}