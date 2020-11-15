import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/ui/task/add_task/data.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubmitButtonState();
  }
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: kElevationToShadow[1],
          ),
          child: SizedBox(
            height: 48,
            child: Center(
              child: Text(
                'Submit',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        onTap: () async {
          if (NewTaskData.taskName == null)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please add a task name'),
            ));
          else if (NewTaskData.description == null)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please add a description'),
            ));
          else if (NewTaskData.priority == null)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please select a priority'),
            ));
          else if (NewTaskData.type == null || NewTaskData.subject == null)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please select type and subject'),
            ));
          else if (DateTime.fromMillisecondsSinceEpoch(NewTaskData.startTime)
              .isAfter(
                  DateTime.fromMillisecondsSinceEpoch(NewTaskData.endTime)))
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Start time cannot be later than end time'),
            ));
          else if (NewTaskData.principals.isEmpty)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please add people'),
            ));
          else {
            try {
              final response = await TaskAPI.newTask(
                NewTaskData.taskName,
                NewTaskData.description,
                NewTaskData.priority,
                NewTaskData.type,
                NewTaskData.subject,
                NewTaskData.project,
                NewTaskData.startTime,
                NewTaskData.endTime,
                NewTaskData.principals,
              );
              if (response['id'] == null)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error: ' + response['message']),
                ));
              else {
                Navigator.pop(context, true);
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Error: ' + e.toString()),
              ));
            }
          }
        },
      ),
    );
  }
}
