import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String formatDate(DateTime dt) {
    final day = dt.day.toString().padLeft(2, '0');
    final month = dt.month.toString().padLeft(2, '0');
    final year = dt.year;
    return '$day.$month.$year';
  }

  String formatTime(DateTime dt) {
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String timeRemaining() {
    final now = DateTime.now();
    if (exam.dateOfExam.isBefore(now)) {
      return 'Испитиот е завршен';
    }
    final diff = exam.dateOfExam.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours - (days * 24);
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          exam.subject,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.lightBlue[100],
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color:Colors.black
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.event, color: Colors.blueGrey),
              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: [
                  Text(
                    'Датум на испит: ${formatDate(exam.dateOfExam)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.schedule, size: 18, color: Colors.blueGrey),
                  Text(
                    formatTime(exam.dateOfExam),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.meeting_room, color: Colors.blueGrey),
              title: Text(
                'Простории: ${exam.rooms.join(', ')}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.timer_outlined, color: Colors.blueGrey),
              title: Text(
                'Преостанато време: ${timeRemaining()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}