import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback? onTap;

  const ExamCard({super.key, required this.exam, this.onTap});

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

  @override
  Widget build(BuildContext context) {
    final past = exam.dateOfExam.isBefore(DateTime.now().subtract(const Duration(minutes: 1)));
    final Color? bg = past ? Colors.grey[400] : Colors.green[100];
    final Color textColor = past ? Colors.black54 : Colors.black;
    final String dateStr = formatDate(exam.dateOfExam);
    final String timeStr = formatTime(exam.dateOfExam);

    return Card(
      color: bg,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(exam.subject, style: TextStyle(color: textColor)),
        subtitle: Row(
          children: [
            const Icon(Icons.calendar_today, size: 16),
            const SizedBox(width: 6),
            Text(dateStr, style: TextStyle(color: textColor)),
            const SizedBox(width: 12),
            const Icon(Icons.schedule, size: 16),
            const SizedBox(width: 6),
            Text(timeStr, style: TextStyle(color: textColor)),
            const SizedBox(width: 12),
            const Icon(Icons.room, size: 16),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                exam.rooms.join(', '),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}