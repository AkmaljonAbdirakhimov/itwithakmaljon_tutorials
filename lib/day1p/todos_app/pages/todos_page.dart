import 'package:day1/day1p/todos_app/widgets/enhanced_todo_list.dart';
import 'package:flutter/material.dart';

import '../widgets/add_todo_dialog.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  void _showAddDialog(BuildContext context) {
    showDialog(context: context, builder: (ctx) => const AddTodoDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rejalar"),
        actions: [
          IconButton(
            onPressed: () => _showAddDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const EnhancedTodoList(),
    );
  }
}
