import 'package:company_scheduler/logic/api/task/task_comment_model.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final TaskComment comment;

  Comment({@required this.comment});

  @override
  Widget build(BuildContext context) {
    final DateTime commentTime =
        DateTime.fromMillisecondsSinceEpoch(comment.commentTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.principal.name,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  comment.comment +
                      ', ' +
                      comment.hoursWorked.toStringAsFixed(
                        comment.hoursWorked % 1 == 0 ? 0 : 1,
                      ) +
                      'h',
                ),
              ),
              Text(
                commentTime.day.toString() +
                    '.' +
                    commentTime.month.toString() + "."+ commentTime.year.toString() +
                    '  ' +
                    commentTime.hour.toString() + " :"+ commentTime.minute.toString() +
                    'h',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
