import 'package:flutter/material.dart';
import 'screens/exam_list.dart';

void main() {
  runApp(const ExamScheduleApp());
}

class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Распоред за Испити',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[100],
        useMaterial3: true,
      ),
      home: const ExamListScreen(),
    );
  }
}
