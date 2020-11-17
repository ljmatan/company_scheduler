import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/comment.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/new_comment/new_comment_row.dart';
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

class _TaskCommentsState extends State<TaskComments>
    with AutomaticKeepAliveClientMixin {
  Future<List> _getTaskComments() async =>
      await TaskAPI.getTaskComments(widget.taskID);

  void _updateComments() => setState(() {});

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _getTaskComments(),
      builder: (context, comments) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                Internationalization.task('comments'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NewCommentRow(
              taskID: widget.taskID,
              updateComments: _updateComments,
            ),
            if (comments.connectionState != ConnectionState.done)
              SizedBox(
                height: 80,
                child: Center(child: CustomSpinningIndicator(size: 40)),
              )
            else if (comments.hasError)
              Text(
                Internationalization.misc('error') +
                    ': ' +
                    comments.error.toString(),
              )
            else if (comments.hasData && comments.data.isNotEmpty)
              for (var comment in comments.data)
                Comment(comment: TaskComment.fromJson(comment))
            else if (comments.hasData && comments.data.isEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(Internationalization.task('none')),
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
