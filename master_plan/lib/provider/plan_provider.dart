import 'package:flutter/material.dart';
import '/models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required super.child,
    required ValueNotifier<List<Plan>> super.notifier,
  });

  // Metode untuk mendapatkan ValueNotifier dari context
  static ValueNotifier<List<Plan>> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    assert(provider != null, 'No PlanProvider found in context');
    return provider!.notifier!;
  }
}