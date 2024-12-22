import 'package:flutter/material.dart';

class WhyUseConst extends StatelessWidget {
  const WhyUseConst({super.key});

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      'IT with Akmaljon',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    print(text.hashCode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nima uchun const ishlatish kerak?'),
      ),
      body: Center(child: text),
    );
  }
}
