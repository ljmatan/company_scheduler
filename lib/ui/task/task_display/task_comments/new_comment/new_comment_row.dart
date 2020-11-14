import 'package:company_scheduler/ui/task/task_display/task_comments/new_comment/new_comment_field.dart';
import 'package:company_scheduler/ui/task/task_display/task_comments/new_comment/submit_comment.dart';
import 'package:flutter/material.dart';

class NewCommentRow extends StatefulWidget {
  final String taskID;
  final Function updateComments;

  NewCommentRow({
    @required this.taskID,
    @required this.updateComments,
  });

  @override
  State<StatefulWidget> createState() {
    return _NewCommentRowState();
  }
}

class _NewCommentRowState extends State<NewCommentRow> {
  final PageController _pageController = PageController();
  final TextEditingController _newCommentController = TextEditingController();
  final TextEditingController _timeWorkedController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            NewCommentField(
              controller: _newCommentController,
              pageController: _pageController,
            ),
            SubmitComment(
              controller: _timeWorkedController,
              pageController: _pageController,
              commentController: _newCommentController,
              taskID: widget.taskID,
              updateComments: widget.updateComments,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timeWorkedController.dispose();
    _newCommentController.dispose();
    super.dispose();
  }
}
