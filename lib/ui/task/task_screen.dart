import 'dart:async';
import 'package:company_scheduler/logic/api/task/task_api.dart';
import 'package:company_scheduler/logic/api/task/task_details_model.dart';
import 'package:company_scheduler/logic/i18n/i18n.dart';
import 'package:company_scheduler/ui/shared/custom_spinning_indicator.dart';
import 'package:company_scheduler/ui/task/add_task/add_task_button.dart';
import 'package:company_scheduler/ui/task/current_tasks.dart';
import 'package:company_scheduler/ui/shared/task_entry.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class TaskScreen extends StatelessWidget {
  Future<List> _getTasks() async => await TaskAPI.getTaskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Text(Internationalization.dash('task')),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _getTasks(),
        builder: (context, tasks) => tasks.hasError
            ? Center(
                child: Text(
                  'Error: ' + tasks.error.toString(),
                  textAlign: TextAlign.center,
                ),
              )
            : !tasks.hasData
                ? Center(child: CustomSpinningIndicator())
                : CurrentTasks(
                    tasks: [
                      for (var task in tasks.data)
                        TaskEntry(
                          task: TaskDetails.fromJson(task),
                        ),
                    ],
                  ),
      ),
      floatingActionButton: AddTaskButton(),
    );
  }
}
