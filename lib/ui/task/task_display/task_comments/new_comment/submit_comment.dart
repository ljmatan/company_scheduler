import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:flutter/material.dart';

class SubmitComment extends StatelessWidget {
  final TextEditingController controller, commentController;
  final PageController pageController;
  final String taskID;
  final Function updateComments;

  SubmitComment({
    @required this.controller,
    @required this.pageController,
    @required this.commentController,
    @required this.taskID,
    @required this.updateComments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 64,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Text(
              '  hours worked',
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              ),
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => WillPopScope(
                    onWillPop: () async => false,
                    child: Center(
                      child: CustomSpinningIndicator(),
                    ),
                  ),
                );
                try {
                  final response = await TaskAPI.newTaskComment(
                    int.parse(taskID),
                    commentController.text,
                    DateTime.now().toIso8601String().substring(0, 16),
                    double.parse(controller.text),
                  );
                  if (response['id'] != null)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Success')),
                    );
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Comment not added')));
                  Navigator.pop(context);
                  commentController.clear();
                  controller.clear();
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                  updateComments();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ' + e.toString())),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
