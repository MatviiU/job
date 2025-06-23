import 'package:flutter/material.dart';
import 'package:test_task/screens/main_screen.dart';
import 'package:test_task/screens/refactorCode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: RefactorCode(),
      debugShowCheckedModeBanner: false,
    );
  }
}
