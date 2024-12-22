import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'day1p/todos_app/pages/todos_page.dart';

void main() {
  runApp(const ProviderScope(
    child: TodosApp(),
  ));
}

class TodosApp extends StatelessWidget {
  const TodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodosPage(),
    );
  }
}
