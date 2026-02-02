import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String phone;

  const ResultPage({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتيجة البحث'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الاسم: $name',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'رقم الهاتف: $phone',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}