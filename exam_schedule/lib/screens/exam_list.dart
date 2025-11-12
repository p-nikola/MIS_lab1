import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import "exam_detail.dart";

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Exam> exams = [
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateOfExam: DateTime(2024, 1, 12, 9, 0),
        rooms: ['215', '200v'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateOfExam: DateTime(2026, 1, 15, 12, 0),
        rooms: ['Lab 2', 'Lab 138', 'Lab 215'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateOfExam: DateTime(2025, 12, 18, 14, 0),
        rooms: ['Lab 200AB', 'Lab 200V', 'Lab 215'],
      ),
      Exam(
        subject: 'Архитектура и организација на компјутери',
        dateOfExam: DateTime(2025, 1, 20, 9, 0),
        rooms: ['Lab 215'],
      ),
      Exam(
        subject: 'Вештачка интелигенција',
        dateOfExam: DateTime(2025, 1, 25, 9, 0),
        rooms: ['Lab 2'],
      ),
      Exam(
        subject: 'Информациска безбедност',
        dateOfExam: DateTime(2025, 1, 28, 10, 0),
        rooms: ['Lab 2'],
      ),
      Exam(
        subject: 'Дизајн на алгоритми',
        dateOfExam: DateTime(2025, 2, 1, 13, 0),
        rooms: ['Lab 2'],
      ),
      Exam(
        subject: 'Интернет технологии',
        dateOfExam: DateTime(2025, 2, 3, 9, 0),
        rooms: ['Lab 3'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateOfExam: DateTime(2025, 12, 10, 9, 0),
        rooms: ['Lab 138'],
      ),
      Exam(
        subject: 'Објектно ориентирано програмирање',
        dateOfExam: DateTime(2025, 12, 15, 12, 0),
        rooms: ['Lab 117'],
      ),
      Exam(
        subject: 'Машинско учење',
        dateOfExam: DateTime(2025, 11, 23, 10, 0),
        rooms: ['Lab 215'],
      ),
      Exam(
        subject: 'Администрација на мрежи',
        dateOfExam: DateTime(2026, 1, 12, 8, 0),
        rooms: ['Lab 200AB'],
      ),
      Exam(
        subject: 'Податочно рударство',
        dateOfExam: DateTime(2025, 11, 2, 13, 0),
        rooms: ['Lab 12', 'Lab 13'],
      ),
      Exam(
        subject: 'Формални јазици и автомати',
        dateOfExam: DateTime(2025, 11, 2, 13, 0),
        rooms: ['Lab 200AB'],
      ),
      Exam(
        subject: 'Напредно програмирање',
        dateOfExam: DateTime(2025, 8, 20, 9, 0),
        rooms: ['Lab 2', 'Lab 3'],
      ),
    ];

    exams.sort((a, b) => a.dateOfExam.compareTo(b.dateOfExam));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Распоред за испити - 226052'),
        backgroundColor: Colors.pink[50],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
        itemCount: exams.length,
        itemBuilder: (context, i) {
          final e = exams[i];
          return ExamCard(
            exam: e,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: e)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.pink[50],
        height: 70,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вкупно испити',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            Badge(
              backgroundColor: Colors.blue[200],
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              label: Text(
                '${exams.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
