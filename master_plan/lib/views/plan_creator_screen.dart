import 'package:flutter/material.dart';
import 'package:master_plan/provider/plan_provider.dart'; // PlanProvider import
import 'package:master_plan/models/data_layer.dart'; // Plan model import

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
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

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans Wulansari')),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }

  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Add a plan',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            onEditingComplete: addPlan,
          ),
        ),
      ),
    );
  }

  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.note, size: 100, color: Colors.grey),
            Text('Anda belum memiliki rencana apapun.',
                style: Theme.of(context).textTheme.headlineSmall)
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text('${plan.completedTaskCount} out of ${plan.tasks.length} tasks completed'), // Menampilkan jumlah task selesai
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PlanScreen(plan: plan), // Mengirim objek plan
            ));
          },
        );
      },
    );
  }
}

class PlanScreen extends StatelessWidget {
  final Plan plan;

  const PlanScreen({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(plan.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            Text('${plan.completedTaskCount} out of ${plan.tasks.length} tasks', 
              style: Theme.of(context).textTheme.bodyLarge),
            Expanded(
              child: ListView.builder(
                itemCount: plan.tasks.length,
                itemBuilder: (context, index) {
                  final task = plan.tasks[index];
                  return ListTile(
                    title: Text(task as String),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}