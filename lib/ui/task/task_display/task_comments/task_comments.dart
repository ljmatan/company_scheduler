import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/comment.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/new_comment_field.dart';
import 'package:flutter/material.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/logic/api/task/task_comment_model.dart';

class TaskComments extends StatefulWidget {
  final String taskID;

  TaskComments({@required this.taskID});
  @override
  State<StatefulWidget> createState() {
    return _TaskCommentsState();
  }
}

class _TaskCommentsState extends State<TaskComments> {
  final TextEditingController _newCommentController = TextEditingController();

  Future<List> _getTaskComments() async =>
      await TaskAPI.getTaskComments(widget.taskID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTaskComments(),
      builder: (context, comments) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                'Comments',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NewCommentField(controller: _newCommentController),
            if (comments.connectionState != ConnectionState.done)
              SizedBox(
                height: 80,
                child: Center(child: CustomSpinningIndicator(size: 40)),
              )
            else if (comments.hasError)
              Text('Error: ' + comments.error.toString())
            else if (comments.hasData && comments.data.isNotEmpty)
              for (var comment in comments.data)
                Comment(comment: TaskComment.fromJson(comment))
            else if (comments.hasData && comments.data.isEmpty)
              Text('None')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newCommentController.dispose();
    super.dispose();
  }
}
