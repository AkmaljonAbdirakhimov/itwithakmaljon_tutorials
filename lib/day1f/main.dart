import 'package:flutter/material.dart';

import 'why_use_const.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WhyUseConst(),
    );
  }
}
