import 'package:flutter/material.dart';
import 'package:master_plan/provider/plan_provider.dart';
import 'package:master_plan/models/data_layer.dart'; // Import model Plan

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
    final plan = Plan(name: text, tasks: []); // Membuat Plan baru
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan); // Menambahkan plan ke daftar
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {}); // Memperbarui UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans')),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()) // Menampilkan rencana
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
        borderRadius: BorderRadius.circular(8), // Membuat sudut bulat
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Mengatur jarak dalam TextField
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
          subtitle: Text('${plan.completedTaskCount} out of ${plan.tasks.length} tasks'),
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

class PlanScreen extends StatefulWidget {
  final Plan plan;

  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void addTask() {
    final taskName = taskController.text;
    if (taskName.isEmpty) {
      return;
    }
    setState(() {
      widget.plan.tasks.add(Task(name: taskName, isComplete: false)); // Menambahkan task baru
    });
    taskController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.plan.name),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(widget.plan.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),
          Text(
            '${widget.plan.completedTaskCount} out of ${widget.plan.tasks.length} tasks completed', // Menampilkan jumlah task selesai
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          _buildTaskCreator(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.plan.tasks.length,
              itemBuilder: (context, index) {
                final task = widget.plan.tasks[index];
                return ListTile(
                  title: Text(task.name),
                  trailing: Checkbox(
                    value: task.isComplete,
                    onChanged: (value) {
                      setState(() {
                        task.isComplete = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildTaskCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              labelText: 'Add a task',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            onEditingComplete: addTask,
          ),
        ),
      ),
    );
  }
}